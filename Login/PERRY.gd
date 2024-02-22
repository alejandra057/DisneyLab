extends CharacterBody2D

var temporizador
const speed= 250
var current_dir = "none"
var animacion
var ronda1=true
var ronda2=false
var ronda3=false
var ronda4=false
var ronda5=false
var cntarentrada=0;
var posicioninicial
var vida1
var vida2
var vida3
var vida4
var vida5
var habilitarA=false
var habilitarB=false
var habilitarC=false
var habilitarD=false
@onready var anima=$"../Sprite2D/animacionD"
@onready var anima2=$"../Sprite2D2/AnimacionA"
@onready var anima3=$"../Sprite2D3/AnimacionC"
@onready var anima4=$"../Sprite2D4/AnimacionB"
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var contar=0
func _ready():
	temporizador = $"../Timer"
	animacion=$spriteironman
	$spriteironman.play("espalda")
	Saveus.posicioninicial=$".".position
	print("posicion ",posicioninicial)
	vida1=$"1vida"
	vida2=$"2vida"
	vida3=$"3vida"
	vida4=$"4vida"
	vida5=$"5vida"
	vida5.hide()
	vida4.hide()
	vida3.hide()
	vida2.hide()
	vida1.hide()


func _physics_process(delta):
	player_movement(delta)
	
func player_movement (delta):
	
	if Input.is_action_pressed("ui_right"):
		current_dir= "right"
		play_anim(1)
		velocity.x = speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_left"):
		current_dir= "left"
		play_anim(1)
		velocity.x =-speed
		velocity.y = 0
	elif  Input.is_action_pressed("ui_down"):
		current_dir= "down"
		play_anim(1)
		velocity.y= speed
		velocity.x= 0
	elif  Input.is_action_pressed("ui_up"):
		current_dir= "up"
		play_anim(1)
		velocity.y = -speed
		velocity.x = 0
	else:
		play_anim(0)
		velocity.x = 0
		velocity.y = 0
	move_and_slide()
	
func play_anim(movement):
	var dir= current_dir
	var anim = $spriteironman

	if dir == "right":
		anim.flip_h = false 
		if movement ==1:
			anim.play("derecha")
		elif  movement == 0:
			anim.play("derecha")
			anim.stop()
	if dir == "left":
		anim.flip_h = false
		if movement ==1:
			anim.play("izquierda")
		elif  movement == 0:
			anim.play("izquierda")
			anim.stop()
	if dir == "down":
		anim.flip_h = false 
		if movement ==1:
			anim.play("Frente")
		elif  movement == 0:
			anim.play("Frente")
			anim.stop()
	if dir == "up":
		anim.flip_h = false
		if movement ==1:
			anim.play("espalda")
		elif  movement == 0:
			anim.play("espalda")
			anim.stop()
		



func _on_area_2d_body_entered(body):
	print("entroxddd")
	$"../FondoC".hide()
	if $Node2D.valor==1:
		Saveus.contarpalabra+=1
		$"../alien2".stop()
		$"../alien2".hide()
		$Node2D._process(body)
		vida2.show()
		$lbinfo.show()
		$lbinfo.text="Respuesta Correcta"
		temporizador.wait_time = 1.5
		temporizador.start()
	else:
		print("Respuesta incorrecta")
		$"../alien2".show()
		$"../alien2".play()
		$"../Sprite2D3".show()
		anima3.play("exp")
		temporizador.wait_time = 1.5
		temporizador.start()
	
	Saveus.contarpalabra=0
	pass # Replace with function body.

func _on_area_a_body_entered(body):
	contar+=1;
	animacion.play("abajo")
	print("Entra en perry")
	$"../FondoA".hide()
	$Node2D._process(body)
	Saveus.contarpalabra=0
	$"../Sprite2D2".show()
	anima2.play("exp")
	temporizador.wait_time = 1.5
	temporizador.start()
	$"../alien".play()
	
	pass # Replace with function body.


func _on_area_d_body_entered(body):
	contar+=1;
	$"../FondoD".hide()
	$Node2D._process(body)
	Saveus.contarpalabra=0
	$"../Sprite2D".show()
	anima.play("exp")
	temporizador.wait_time = 1.5
	temporizador.start()
	$"../alien3".play()
	pass # Replace with function body.


func _on_areab_body_entered(body):
	contar+=1;
	$"../FondoB".hide()
	if $Node2D.valor!=1:
		Saveus.contarpalabra+=1
		$Node2D._process(body)
		#if $Node2D.valor==0:
		vida1.show()
		$lbinfo.show()
		temporizador.wait_time = 1.5
		temporizador.start()
		print("valorrr ",$Node2D.valor)
		if $Node2D.valor==3:
			$"../alien4".hide()
			vida3.show()
			vida2.hide()
			vida1.hide()
			temporizador.wait_time = 1.5
			temporizador.start()
			$lbinfo.text="Respuesta Correcta"
			temporizador.wait_time = 1.5
			temporizador.start()
		if $Node2D.valor==4:
			$"../alien4".hide()
			vida4.show()
			vida3.hide()
			temporizador.wait_time = 1.5
			temporizador.start()
			$lbinfo.text="Respuesta Correcta"
			temporizador.wait_time = 1.5
			temporizador.start()
		if $Node2D.valor==5:
			vida5.show()
			vida4.hide()
			$"../alien4".hide()
			$lbinfo.text="Felicidades!"
			$lbinfo/Button.show()
			temporizador.stop()
	else:
			$"../Sprite2D4".show()
			anima4.play("exp")
			temporizador.wait_time = 1.5
			temporizador.start()
			$"../alien4".show()
			$"../alien4".play()
	Saveus.contarpalabra=0
	pass # Replace with function body.


func _on_señal_body_entered(body):
	print("entraaa")
	contar+=1
	if contar>1:
		$"../Texto".show()
	pass # Replace with function body.


func _on_señal_body_exited(body):
	$"../Texto".hide()
	pass # Replace with function body.


func _on_preguntas_body_entered(body):
	
	#DialogueManager.show_dialogue_balloon(load("res://PreguntasCiencia.dialogue"),"Preguntas")
	$Node2D.show()
	pass # Replace with function body.


func _on_preguntas_body_exited(body):
	$Node2D.hide()
	pass # Replace with function body.


func _on_timer_timeout():
	$".".position=Saveus.posicioninicial
	temporizador.stop()
	$"../abrirA".stop()
	$"../abrirB".stop()
	$"../abrirc".stop()
	$"../abrird".stop()
	$"../FondoC".show()
	$"../FondoA".show()
	$"../FondoB".show()
	$"../FondoD".show()
	$"../alien".stop()
	$lbinfo.hide()
	if $Node2D.valor==4:
		$Node2D.valor+=1
	pass # Replace with function body."res://Escenas/inicioworld.tscn"


func _on_button_pressed():
	get_tree().change_scene_to_file("res://Escenas/inicioworld.tscn")


func _on_area_puerta_a_body_entered(body):
	$"../abrirA".play("Abrir")
	$"../AreaPuertaA/TimerArea".wait_time=0.8
	$"../AreaPuertaA/TimerArea".start()
	habilitarA=true
	$"../abrirB".stop()
	$"../abrirc".stop()
	$"../abrird".stop()
	pass # Replace with function body.


func _on_timer_area_timeout():
	$"../AreaPuertaA/TimerArea".stop()
	if(habilitarA==true):
		$"../abrirA".stop()
		$"../abrirA".frame=3
		
		habilitarA=false
	if(habilitarB==true):
		$"../abrirB".stop()
		$"../abrirB".frame=3
		
		habilitarB=false
	if(habilitarC==true):
		$"../abrirc".stop()
		$"../abrirc".frame=3
		
		habilitarC=false
	if(habilitarD==true):
		$"../abrird".stop()
		$"../abrird".frame=3
		
		habilitarD=false
	pass # Replace with function body.


func _on_area_puerta_b_body_entered(body):
	$"../abrirB".play("Abrir")
	$"../AreaPuertaA/TimerArea".wait_time=0.8
	$"../AreaPuertaA/TimerArea".start()
	habilitarB=true
	$"../abrirA".stop()
	$"../abrirc".stop()
	$"../abrird".stop()
	pass # Replace with function body.


func _on_area_puerta_c_body_entered(body):
	$"../abrirc".play("Abrir")
	$"../AreaPuertaA/TimerArea".wait_time=0.8
	$"../AreaPuertaA/TimerArea".start()
	habilitarC=true
	$"../abrirA".stop()
	$"../abrirB".stop()
	$"../abrird".stop()
	pass # Replace with function body.


func _on_area_puerta_d_body_entered(body):
	$"../abrird".play("Abrir")
	$"../AreaPuertaA/TimerArea".wait_time=0.8
	$"../AreaPuertaA/TimerArea".start()
	habilitarD=true
	$"../abrirA".stop()
	$"../abrirB".stop()
	$"../abrirc".stop()
	pass # Replace with function body.
