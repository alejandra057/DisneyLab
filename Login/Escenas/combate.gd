extends Node2D
var tiempo_restante = 10
var timer
var respondio=false
var respondiobien=0
var respondiomal=0
var rondas
var velocidad = Vector2(100, 0) 
var direccion = Vector2.RIGHT
var tiempoRonda=4
var cantrondas=1
var contarrondas=0
var escudo
var telarana
var animation_time
var animation_time2
var contador=0
var mostrarmsj=false
var puntosganador=0
var puntosperdedor=0
var animation_victory
var some_health_amount_c=150
var current_value_c:int
var max_value_c: int
var some_health_amount_i=150
var current_value_i:int
var max_value_i: int
var progreso
@onready var health_barC : ProgressBar=$CanvasLayer/ColorRect/HealthBarC
@onready var health_textC: RichTextLabel=$CanvasLayer/ColorRect/HealthBarC/RichTextLabel
@onready var health_barI : ProgressBar=$CanvasLayer2/ColorRect/HealthBarI
@onready var health_textI: RichTextLabel=$CanvasLayer2/ColorRect/HealthBarI/RichTextLabel
# Called when the node enters the scene tree for the first time.
func _ready():
	_update_health_bar_Cap(1000,1000)
	_update_health_bar_iron(1000,1000)
	vidas_generales()
	$Label.text = "Ronda "+str(cantrondas)+"\n"
	timer=$tiempocontestar
	rondas=$timerrondas
	rondas.start()
	escudo=$"captain america/escudo"
	animation_time=$animacion
	animation_time2=$animacion2
	animation_victory=$animacion_ganar
	Saveus.juego_progreso=progreso
	if Saveus.iron_man==true:
		$Bandoelegido_2.show()
	elif Saveus.capitan==true:
		$Bandoelegido.show()
	pass # Replace with function body.
	
	#vidas capitan
func _update_health_bar_Cap(current_hp_c:int,max_hp_c:int)->void:
	current_value_c= current_hp_c
	max_value_c = max_hp_c
	health_barC.max_value=max_hp_c
	health_barC.value=current_hp_c
	health_textC.clear()
	health_textC.append_text("[center][b]%s/%s"% [current_hp_c,max_hp_c])
	
func _update_health_bar_color_Cap(current_hp_c:int,max_hp_c:int)->void:
	if(current_hp_c > max_hp_c * 0.6):
		health_barC.set_theme_type_variation("HealthBar")
	elif(current_hp_c > max_hp_c * 0.3):
		health_barC.set_theme_type_variation("HealthBarMid")
	else:
		health_barC.set_theme_type_variation("HealthBarLow")
	
func add_health_Cap()->void:
	current_value_c += some_health_amount_c
	if(current_value_c > max_value_c):
		current_value_c=max_value_c
	_update_health_bar_Cap(current_value_c,max_value_c)
func reduce_health_Cap()->void:
	current_value_c -=some_health_amount_c
	if(current_value_c <0):
		current_value_c=0
	_update_health_bar_Cap(current_value_c,max_value_c)
	
	
#vidas ironman
func _update_health_bar_iron(current_hp_i:int,max_hp_i:int)->void:
	current_value_i= current_hp_i
	max_value_i = max_hp_i
	health_barI.max_value=max_hp_i
	health_barI.value=current_hp_i
	health_textI.clear()
	health_textI.append_text("[center][b]%s/%s"% [current_hp_i,max_hp_i])
	
func _update_health_bar_color_iron(current_hp_i:int,max_hp_i:int)->void:
	if(current_hp_i > max_hp_i * 0.6):
		health_barI.set_theme_type_variation("HealthBar")
	elif(current_hp_i > max_hp_i * 0.3):
		health_barI.set_theme_type_variation("HealthBarMid")
	else:
		health_barI.set_theme_type_variation("HealthBarLow")

func add_health_iron()->void:
	current_value_i +=some_health_amount_i
	if(current_value_i > max_value_i):
		current_value_i=max_value_i
	_update_health_bar_iron(current_value_i,max_value_i)
func reduce_health_iron()->void:
	current_value_i -=some_health_amount_i
	if(current_value_i <0):
		current_value_i=0
	_update_health_bar_iron(current_value_i,max_value_i)
	
#funcion ganar
func animacion_ganar():
	if Saveus.capitan==true:
		add_health_Cap()
		$"captain america/CA1".play("ataque")
		escudo.show()
		$"captain america/escudo/AnimationPlayer".play("disco")
		$ironman/ironman1.play("dead")
		reduce_health_iron()
		animation_time.wait_time = 1.5  
		animation_time.start()
		puntosganador+=1
		$punto1.text="Puntos: "+str(puntosganador)
	elif Saveus.iron_man==true:
		add_health_iron()
		$ironman/ironman1.play("ataque")
		$ironman/AnimatedSprite2D.show()
		$ironman/AnimatedSprite2D.play("laser")
		$"captain america/CA1".play("dead")
		reduce_health_Cap()
		animation_time.wait_time = 1.5 
		animation_time.start()
		puntosganador+=1
		$punto2.text="Puntos: "+str(puntosganador)
#funcion perder
func animacion_perder():
	if Saveus.capitan==true:
		reduce_health_Cap()
		$ironman/ironman1.play("ataque")
		$ironman/AnimatedSprite2D.show()
		$ironman/AnimatedSprite2D.play("laser")
		$"captain america/CA1".play("dead")
		add_health_iron()
		animation_time2.wait_time = 1.5 
		animation_time2.start()
		puntosperdedor+=1
		$punto2.text="Puntos: "+str(puntosperdedor)
	elif Saveus.iron_man==true:
		reduce_health_iron()
		$"captain america/CA1".play("ataque")
		escudo.show()
		$"captain america/escudo/AnimationPlayer".play("disco")
		$ironman/ironman1.play("dead")
		add_health_Cap()
		animation_time2.wait_time = 1.5  
		animation_time2.start()
		puntosperdedor+=1
		$punto1.text="Puntos: "+str(puntosperdedor)
		
func _process(delta):
	vidas_generales()
	if contarrondas==1:
		print("enprocess contarronda")
		ocultarpregunta()
		contarrondas=0
		respondiomal=0
		respondiobien=0
	if respondiobien!=respondiomal && contador==2: 
		print("entra")
		ocultarpregunta()
		contador=0
	

func _on_tiempocontestar_timeout():
	tiempo_restante -= 1
	if tiempo_restante > 0:
		$lbtiempo.text = "Tiempo restante: " + str(tiempo_restante) + " segundos"
	else:
		if respondio==false:
			$lbtiempo.text = "Tiempo agotado"
		tiempo_restante = 10
		respondiomal+=1
		contador+=1
		animacion_perder()
	pass # Replace with function body.


func _on_button_pressed():
	contador+=1
	if mostrarmsj:
			print("entro al mostrar msj")
			contarrondas+=1
			mostrarmsj=false
	print("contador",contador)
	if $Node2D.valor==0:
		print("respuesta correcta")
		respondio=true
		tiempo_restante = 10
		respondiobien+=1
		animacion_ganar()
		print("bien ",respondiobien," mal ",respondiomal)
	else:
		respondio=false
		tiempo_restante = 10
		respondiomal+=1
		animacion_perder()
		print("bien ",respondiobien," mal ",respondiomal)
	pass



func _on_button_2_pressed():
	contador+=1
	if mostrarmsj:
			print("entro al mostrar msj")
			contarrondas+=1
			mostrarmsj=false
	print("contador",contador)
	if $Node2D.valor==1 :
		respondio=true
		tiempo_restante = 10
		animacion_ganar()
		respondiobien+=1
		
		print("bien ",respondiobien," mal ",respondiomal)
		
	else:
		print("respuesta incorrecta")
		respondio=false
		
		tiempo_restante = 10
		animacion_perder()
		
		print("bien ",respondiobien," mal ",respondiomal)
		respondiomal+=1
		
	pass # Replace with function body.


func _on_button_3_pressed():
	contador+=1
	print("respuesta incorrecta")
	print("bien ",respondiobien," mal ",respondiomal)
	tiempo_restante = 10
	respondio=false
	animacion_perder()
	
	respondiomal+=1
	if mostrarmsj:
			contarrondas+=1
			mostrarmsj=false
	pass # Replace with function body.


func _on_button_4_pressed():
	contador+=1
	print("respuesta incorrecta")
	print("bien ",respondiobien," mal ",respondiomal)
	tiempo_restante = 10
	respondio=false
	animacion_perder()
	
	respondiomal+=1
	if mostrarmsj:
			contarrondas+=1
			mostrarmsj=false
	pass # Replace with function body.


func _on_timerrondas_timeout():
	tiempoRonda -= 1
	$Label.text = ""
	if tiempoRonda > 0:
		$Label.text = "Ronda "+str(cantrondas)+"\n"+ "       "+str(tiempoRonda) 
		tiempo_restante = 10
	elif cantrondas<2:
			timer.start()
			$Node2D.show()
			$Button.show()
			$Button2.show()
			$Button3.show()
			$Button4.show()
			$lbtiempo.show()
			$Label.hide()
		
	pass 
func vidas_generales():
	if Saveus.capitan==true || Saveus.imagen_vida4==true:
		$vida4.show()
	elif Saveus.capitan==true || Saveus.imagen_vida3==true:
		$vida4.hide()
		$Vida3.show()
func ocultarpregunta():
	cantrondas+=1
	print("cantrondas",cantrondas)
	if cantrondas>1:
		contarrondas=0
		print("aqui iria el ganador")
		if Saveus.capitan==true && puntosganador>1:
			$ganador.text ="Los empiristas han ganado el primer combate "
			$"captain america/CA1".play("victoria")
			$Progreso_game.show()
			$Progreso_game.value=25*100/100
		elif Saveus.iron_man==true && puntosganador>1:
			$ganador.text ="Los racionalista han ganado el primer combate"
			$ironman/ironman1.play("victoria")
			$Progreso_game.show()
			$Progreso_game.value=25*100/100
		ocultar()
	tiempoRonda=1
	rondas.start()
	ocultar()
	

	
	if Saveus.capitan==true && puntosganador==2 || Saveus.iron_man==true && puntosganador==2:
		await get_tree().create_timer(5).timeout
		get_tree().change_scene_to_file("res://intro_combate2.tscn")
	elif  Saveus.capitan==true && puntosperdedor>1 || Saveus.iron_man==true && puntosperdedor>1:
		$Perdistelb.show()
		vidas_generales()
		Saveus.finished_game=0
		$Backbtn.show()
		Saveus.puntos_combates=1
		#puntosperdedor=0
		#puntosganador=0
	tiempo_restante = 10
	print("bien ",respondiobien," mal ",respondiomal)

func empate():
	if respondiobien!=0 && respondiomal!=0:
		if respondiobien==respondiomal:
			$Node2D.valor-=1
			$Node2D.current_text-=1
			$Label.text = "Desempate "
			ocultarpregunta()
			cantrondas-=1
			print("empate")
			mostrarmsj=true
			contador=-1
	$Node2D.next_text()

func ocultar():
	$Node2D.hide()
	$Button.hide()
	$Button2.hide()
	$Button3.hide()
	$Button4.hide()
	$Label.show()
	$lbtiempo.hide()
	timer.stop()


func _on_animacion_timeout():
	animation_time.stop()
	$"captain america/CA1".stop()
	$"captain america/CA1".play("idle")
	$ironman/ironman1.stop()
	$ironman/AnimatedSprite2D.stop()
	$ironman/AnimatedSprite2D.hide()
	$ironman/ironman1.play("idle")
	$"captain america/escudo/AnimationPlayer".stop()
	escudo.hide()
	empate()
	


func _on_animacion_2_timeout():
	animation_time2.stop()
	$"captain america/CA1".stop()
	$"captain america/CA1".play("idle")
	$ironman/ironman1.stop()
	$ironman/AnimatedSprite2D.stop()
	$ironman/AnimatedSprite2D.hide()
	$ironman/ironman1.play("idle")
	$"captain america/escudo/AnimationPlayer".stop()
	escudo.hide()
	empate()
	



func _on_backbtn_pressed():
	get_tree().reload_current_scene()
