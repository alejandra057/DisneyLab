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
var some_health_amount_h=150
var current_value_h:int
var max_value_h: int
var some_health_amount_t=150
var current_value_t:int
var max_value_t: int
@onready var health_barH : ProgressBar=$CanvasLayer2/ColorRect/HealthBarH
@onready var health_textH: RichTextLabel=$CanvasLayer2/ColorRect/HealthBarH/RichTextLabel
@onready var health_barT : ProgressBar=$CanvasLayer/ColorRect/HealthBarT
@onready var health_textT: RichTextLabel=$CanvasLayer/ColorRect/HealthBarT/RichTextLabel
# Called when the node enters the scene tree for the first time.
func _ready():
	_update_health_bar_hulk(1000,1000)
	_update_health_bar_thor(1000,1000)
	$Label.text = "Ronda "+str(cantrondas)+"\n"
	timer=$tiempocontestar
	rondas=$timerrondas
	rondas.start()
	escudo=$"captain america/escudo"
	animation_time=$animacion
	animation_time2=$animacion2
	$Progress_game.value=25
	if Saveus.iron_man==true:
		$Bandoelegido2.show()
	elif Saveus.capitan==true:
		$Bandoelegido.show()
	pass # Replace with function body.
	#vidas hulk
func _update_health_bar_hulk(current_hp_h:int,max_hp_h:int)->void:
	current_value_h= current_hp_h
	max_value_h = max_hp_h
	health_barH.max_value=max_hp_h
	health_barH.value=current_hp_h
	health_textH.clear()
	health_textH.append_text("[center][b]%s/%s"% [current_hp_h,max_hp_h])
	
func _update_health_bar_color_hulk(current_hp_h:int,max_hp_h:int)->void:
	if(current_hp_h > max_hp_h * 0.6):
		health_barH.set_theme_type_variation("HealthBar")
	elif(current_hp_h > max_hp_h * 0.3):
		health_barH.set_theme_type_variation("HealthBarMid")
	else:
		health_barH.set_theme_type_variation("HealthBarLow")
	
func add_health_hulk()->void:
	current_value_h += some_health_amount_h
	if(current_value_h > max_value_h):
		current_value_h=max_value_h
	_update_health_bar_hulk(current_value_h,max_value_h)
func reduce_health_hulk()->void:
	current_value_h -=some_health_amount_h
	if(current_value_h <0):
		current_value_h=0
	_update_health_bar_hulk(current_value_h,max_value_h)
	
	
#vidas thor
func _update_health_bar_thor(current_hp_t:int,max_hp_t:int)->void:
	current_value_t= current_hp_t
	max_value_t = max_hp_t
	health_barT.max_value=max_hp_t
	health_barT.value=current_hp_t
	health_textT.clear()
	health_textT.append_text("[center][b]%s/%s"% [current_hp_t,max_hp_t])
	
func _update_health_bar_color_iron(current_hp_t:int,max_hp_t:int)->void:
	if(current_hp_t > max_hp_t * 0.6):
		health_barT.set_theme_type_variation("HealthBar")
	elif(current_hp_t > max_hp_t * 0.3):
		health_barT.set_theme_type_variation("HealthBarMid")
	else:
		health_barT.set_theme_type_variation("HealthBarLow")
func add_health_thor()->void:
	current_value_t +=some_health_amount_t
	if(current_value_t > max_value_t):
		current_value_t=max_value_t
	_update_health_bar_thor(current_value_t,max_value_t)
func reduce_health_thor()->void:
	current_value_t -=some_health_amount_t
	if(current_value_t <0):
		current_value_t=0
	_update_health_bar_thor(current_value_t,max_value_t)
	
#funcion ganar
func animacion_ganar():
	if Saveus.capitan==true:
		add_health_hulk()
		$hulk/hulk.play("ataque")
		$thor/thor.play("dead")
		reduce_health_hulk()
		animation_time.wait_time = 1.5  
		animation_time.start()
		puntosganador+=1
		$punto1.text="Puntos: "+str(puntosganador)
	elif Saveus.iron_man==true:
		add_health_thor()
		$thor/thor.play("ataque")
		$thor/AnimatedSprite2D2.show()
		$thor/AnimatedSprite2D2.play("martillo")
		$hulk/hulk.play("dead")
		reduce_health_hulk()
		animation_time.wait_time = 1.5 
		animation_time.start()
		puntosganador+=1
		$punto2.text="Puntos: "+str(puntosganador)
#funcion perder
func animacion_perder():
	if Saveus.capitan==true:
		reduce_health_hulk()
		$thor/thor.play("ataque")
		$thor/AnimatedSprite2D2.show()
		$thor/AnimatedSprite2D2.play("martillo")
		$hulk/hulk.play("dead")
		add_health_thor()
		animation_time2.wait_time = 1.5 
		animation_time2.start()
		puntosperdedor+=1
		$punto2.text="Puntos: "+str(puntosperdedor)
	elif Saveus.iron_man==true:
		reduce_health_thor()
		$hulk/hulk.play("ataque")
		$thor/thor.play("dead")
		add_health_hulk()
		animation_time2.wait_time = 1.5  
		animation_time2.start()
		puntosperdedor+=1
		$punto1.text="Puntos: "+str(puntosperdedor)
func _process(delta):
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
	if $Node2D.valor==1:
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


func _on_button_3_pressed():
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

func ocultarpregunta():
	cantrondas+=1
	print("cantrondas",cantrondas)
	if cantrondas>1:
		contarrondas=0
		print("aqui iria el ganador")
		if Saveus.capitan==true && puntosganador>1:
			$ganador.text ="Los empiristas han ganado el segundo combate "
			$hulk/hulk.play("victoria")
			$Progress_game.value=50
		elif Saveus.iron_man==true && puntosganador>1:
			$ganador.text ="Los racionalista han ganado el segundo combate"
			$thor/thor.play("victoria")
			$Progress_game.value=50
		ocultar()
	tiempoRonda=1
	rondas.start()
	ocultar()
	await get_tree().create_timer(10).timeout
	get_tree().change_scene_to_file("res://intro_combate3.tscn")
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
	$hulk/hulk.stop()
	$hulk/hulk.play("idle")
	$thor/thor.stop()
	$thor/AnimatedSprite2D2.stop()
	$thor/AnimatedSprite2D2.hide()
	$thor/thor.play("idle")
	empate()
	


func _on_animacion_2_timeout():
	animation_time2.stop()
	$hulk/hulk.stop()
	$hulk/hulk.play("idle")
	$thor/thor.stop()
	$thor/AnimatedSprite2D2.stop()
	$thor/AnimatedSprite2D2.hide()
	$thor/thor.play("idle")
	empate()
	
