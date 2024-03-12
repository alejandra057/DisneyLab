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
var animation_time
var animation_time2
var contador=0
var mostrarmsj=false
var puntosganador=0
var puntosperdedor=0
var animation_victory
var some_health_amount_b=150
var current_value_b:int
var max_value_b: int
var some_health_amount_m=150
var current_value_m:int
var max_value_m: int
var progreso
@onready var health_barM : ProgressBar=$CanvasLayer/ColorRect/HealthBarM
@onready var health_textM: RichTextLabel=$CanvasLayer/ColorRect/HealthBarM/RichTextLabel
@onready var health_barB : ProgressBar=$CanvasLayer2/ColorRect/HealthBarB
@onready var health_textB: RichTextLabel=$CanvasLayer2/ColorRect/HealthBarB/RichTextLabel
# Called when the node enters the scene tree for the first time.
func _ready():
	_update_health_bar_blackwidow(2000,2000)
	_update_health_bar_capmarvel(2000,2000)
	$Label.text = "Ronda "+str(cantrondas)+"\n"
	timer=$tiempocontestar
	rondas=$timerrondas
	rondas.start()
	animation_time=$animacion
	animation_time2=$animacion2
	animation_victory=$animacion_ganar
	$Progress_game.value=75
	
	if Saveus.iron_man==true:
		$Bandoelegido2.show()
	elif Saveus.capitan==true:
		$Bandoelegido.show()
	pass # Replace with function body.
	#vidas cap marvel
func _update_health_bar_capmarvel(current_hp_m:int,max_hp_m:int)->void:
	current_value_m= current_hp_m
	max_value_m = max_hp_m
	health_barM.max_value=max_hp_m
	health_barM.value=current_hp_m
	health_textM.clear()
	health_textM.append_text("[center][b]%s/%s"% [current_hp_m,max_hp_m])
	
func _update_health_bar_color_capmarvel(current_hp_m:int,max_hp_m:int)->void:
	if(current_hp_m > max_hp_m * 0.7):
		health_barM.set_theme_type_variation("HealthBar")
	elif(current_hp_m > max_hp_m * 0.4):
		health_barM.set_theme_type_variation("HealthBarMid")
	else:
		health_barM.set_theme_type_variation("HealthBarLow")
	
func add_health_capmarvel()->void:
	current_value_m += some_health_amount_m
	if(current_value_m > max_value_m):
		current_value_m=max_value_m
	_update_health_bar_capmarvel(current_value_m,max_value_m)
func reduce_health_capmarvel()->void:
	current_value_m -=some_health_amount_m
	if(current_value_m <0):
		current_value_m=0
	_update_health_bar_capmarvel(current_value_m,max_value_m)
	
	
#vidas blackwidow
func _update_health_bar_blackwidow(current_hp_b:int,max_hp_b:int)->void:
	current_value_b= current_hp_b
	max_value_b = max_hp_b
	health_barB.max_value=max_hp_b
	health_barB.value=current_hp_b
	health_textB.clear()
	health_textB.append_text("[center][b]%s/%s"% [current_hp_b,max_hp_b])
	
func _update_health_bar_color_blackwidow(current_hp_b:int,max_hp_b:int)->void:
	if(current_hp_b > max_hp_b * 0.6):
		health_barB.set_theme_type_variation("HealthBar")
	elif(current_hp_b > max_hp_b * 0.3):
		health_barB.set_theme_type_variation("HealthBarMid")
	else:
		health_barB.set_theme_type_variation("HealthBarLow")
func add_health_blackwidow()->void:
	current_value_b +=some_health_amount_b
	if(current_value_b > max_value_b):
		current_value_b=max_value_b
	_update_health_bar_blackwidow(current_value_b,max_value_b)
func reduce_health_blackwidow()->void:
	current_value_b -=some_health_amount_b
	if(current_value_b <0):
		current_value_b=0
	_update_health_bar_blackwidow(current_value_b,max_value_b)
	
#funcion ganar
func animacion_ganar():
	if Saveus.capitan==true:
		add_health_capmarvel()
		$capitana/capitana1.play("ataque")
		$Blackwidow/bw.play("dead")
		reduce_health_blackwidow()
		animation_time.wait_time = 1.5  
		animation_time.start()
		puntosganador+=1
		$punto1.text="Puntos: "+str(puntosganador)
	elif Saveus.iron_man==true:
		add_health_blackwidow()
		$Blackwidow/bw.play("ataque")
		$capitana/capitana1.play("dead")
		reduce_health_capmarvel()
		animation_time.wait_time = 1.5 
		animation_time.start()
		puntosganador+=1
		$punto2.text="Puntos: "+str(puntosganador)
#funcion perder
func animacion_perder():
	if Saveus.capitan==true:
		reduce_health_capmarvel()
		$Blackwidow/bw.play("ataque")
		$capitana/capitana1.play("dead")
		add_health_blackwidow()
		animation_time2.wait_time = 1.5 
		animation_time2.start()
		puntosperdedor+=1
		$punto2.text="Puntos: "+str(puntosperdedor)
	elif Saveus.iron_man==true:
		reduce_health_blackwidow()
		$capitana/capitana1.play("ataque")
		$Blackwidow/bw.play("dead")
		add_health_capmarvel()
		animation_time2.wait_time = 1.5  
		animation_time2.start()
		puntosperdedor+=1
		$punto1.text="Puntos: "+str(puntosperdedor)
func animacion_victoria():
	if Saveus.capitan==true:
		$capitana/capitana1.play("victoria")
		animation_victory.wait_time = 1.5  
		animation_victory.start()
	elif Saveus.iron_man==true:
		$Blackwidow/bw.play("victoria")
		animation_victory.wait_time = 1.5  
		animation_victory.start()
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
	print("respuesta incorrecta")
	print("bien ",respondiobien," mal ",respondiomal)
	tiempo_restante = 10
	respondio=false
	animacion_perder()
	
	respondiomal+=1
	if mostrarmsj:
			contarrondas+=1
			mostrarmsj=false
	pass # Replace with fu




func _on_button_2_pressed():
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
	pass # Replace with fu


func _on_button_3_pressed():
	contador+=1
	if mostrarmsj:
			print("entro al mostrar msj")
			contarrondas+=1
			mostrarmsj=false
	print("contador",contador)
	if $Node2D.valor==0 || $Node2D.valor==1:
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
			$ganador.text ="Los empiristas han ganado el combate final"
			animacion_victoria()
			$Progreso_game.value=100
		elif Saveus.iron_man==true && puntosganador>1:
			$ganador.text ="Los racionalista han ganado el combate final"
			animacion_victoria()
			$Progreso_game.value=100
		ocultar()
	tiempoRonda=1
	rondas.start()
	ocultar()
	await get_tree().create_timer(10).timeout
	get_tree().change_scene_to_file("res://intro_combate4.tscn")
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
	$Blackwidow/bw.stop()
	$Blackwidow/bw.play("idle")
	$capitana/capitana1.stop()
	$capitana/capitana1.play("idle")
	empate()
	


func _on_animacion_2_timeout():
	animation_time2.stop()
	$Blackwidow/bw.stop()
	$Blackwidow/bw.play("idle")
	$capitana/capitana1.stop()
	$capitana/capitana1.play("idle")
	empate()
	
