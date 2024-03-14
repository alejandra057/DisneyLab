extends CharacterBody2D
var tiempoanim
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
var contarvidas=3
var tiemporegalo
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
	tiempoanim=$irondead/tiempoanimacion
	tiemporegalo=$"../regalos"
	$spriteironman.play("espalda")
	Saveus.posicioninicial=$".".position
	print("posicion ",posicioninicial)

func _process(delta):
	$numpregunta.text="Pregunta "+str($Node2D.current_text+1)
	if contarvidas==0:
		$Node2D.current_text=-1
		contarvidas=3
		$cantvidas.text=str(contarvidas)
	pass

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
		$"../vidaC".show()
		Saveus.contarpalabra+=1
		$"../alien2".stop()
		$"../alien2".hide()
		contarvidas+=1
		$lbinfo.show()
		$lbinfo.text="Respuesta Correcta"
		temporizador.wait_time = 2
		temporizador.start()
	else:
		print("Respuesta incorrecta")
		contarvidas-=1
		$"../alien2".show()
		$"../alien2".play()
		$"../Sprite2D3".show()
		anima3.play("exp")
		temporizador.wait_time = 2
		temporizador.start()
		
		$irondead. set_flip_h(true)
		morir()
	$cantvidas.text="x 0"+str(contarvidas)
	Saveus.contarpalabra=0
	pass # Replace with function body.

func _on_area_a_body_entered(body):
	$irondead. set_flip_h(false)
	contar+=1;
	animacion.play("abajo")
	print("Entra en perry")
	$"../FondoA".hide()
	$Node2D._process(body)
	Saveus.contarpalabra=0
	$"../Sprite2D2".show()
	anima2.play("exp")
	temporizador.wait_time = 2
	temporizador.start()
	$"../alien".play()
	contarvidas-=1
	
	morir()
	$cantvidas.text="x 0"+str(contarvidas)
	pass # Replace with function body.


func _on_area_d_body_entered(body):
	$irondead. set_flip_h(true)
	contar+=1;
	$"../FondoD".hide()
	Saveus.contarpalabra=0
	$"../Sprite2D".show()
	anima.play("exp")
	temporizador.wait_time = 2
	temporizador.start()
	$"../alien3".play()
	contarvidas-=1
	morir()
	$cantvidas.text="x 0"+str(contarvidas)
	pass # Replace with function body.


func _on_areab_body_entered(body):
	$irondead. set_flip_h(false)
	contar+=1;
	$"../FondoB".hide()
	if $Node2D.valor!=1:
		Saveus.contarpalabra+=1
		$"../vidaB".show()
		
		#if $Node2D.valor==0:
		contarvidas+=1
		$lbinfo.show()
		temporizador.wait_time = 2
		temporizador.start()
		print("valorrr ",$Node2D.valor)
		#if $Node2D.valor==3:
			#$"../alien4".hide()
			#contarvidas+=1
			#temporizador.wait_time = 1.5
			#temporizador.start()
			#$lbinfo.text="Respuesta Correcta"
			#temporizador.wait_time = 1.5
			#temporizador.start()
		#if $Node2D.valor==4:
			#$"../alien4".hide()
			#contarvidas+=1
			#temporizador.wait_time = 1.5
			#temporizador.start()
			#$lbinfo.text="Respuesta Correcta"
			#temporizador.wait_time = 1.5
			#temporizador.start()
		if $Node2D.valor==5:
			contarvidas+=1
			$"../alien4".hide()
			$lbinfo.text="Felicidades!"
			Saveus.finished_game+=1
			$lbinfo/Button.show()
			temporizador.stop()
	else:
			morir()
			$"../Sprite2D4".show()
			anima4.play("exp")
			temporizador.wait_time = 2
			temporizador.start()
			$"../alien4".show()
			$"../alien4".play()
			contarvidas-=1
	Saveus.contarpalabra=0
	$cantvidas.text="x 0"+str(contarvidas)
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


func _on_timer_timeout():
	$"../abrir".hide()
	$"../cerrada".show()
	$"../abrir3".hide()
	$"../cerrada3".show()
	$"../cerrada2".show()
	$"../cerrada4".show()
	$"../abrir2".hide()
	$"../abrir4".hide()
	$spriteironman.show()
	$irondead.hide()
	$".".position=Saveus.posicioninicial
	temporizador.stop()
	$"../FondoC".show()
	$"../FondoA".show()
	$"../FondoB".show()
	$"../FondoD".show()
	$"../alien".stop()
	$lbinfo.hide()
	$Node2D.next_text()
	
	if $Node2D.valor==4:
		$Node2D.valor+=1


func _on_button_pressed():
	get_tree().change_scene_to_file("res://Escenas/inicioworld.tscn")

func _on_area_puerta_a_body_entered(body):
	$"../cerrada2".hide()
	$"../abrir2".show()

func _on_timer_area_timeout():
	$"../AreaPuertaA/TimerArea".stop()
	pass # Replace with function body.


func _on_area_puerta_b_body_entered(body):
	$"../abrir".show()
	$"../cerrada".hide()


func _on_area_puerta_c_body_entered(body):
	$"../cerrada4".hide()
	$"../abrir4".show()
	pass # Replace with function body.


func _on_area_puerta_d_body_entered(body):
	$"../abrir3".show()
	$"../cerrada3".hide()
	pass # Replace with function body.


func _on_tiempoanimacion_timeout():
	tiempoanim.stop()
	$irondead.stop()
	pass # Replace with function body.

func morir():
	$irondead.show()
	$irondead.play("dead")
	tiempoanim.wait_time=0.5
	tiempoanim.start()
	$spriteironman.hide()


func _on_areacorazon_b_body_entered(body):
	$"../vidaB".hide()
	pass # Replace with function body.

func _on_area_corazon_c_body_entered(body):
	$"../vidaC".hide()
	pass # Replace with function body.


func _on_arearegalob_body_entered(body):
	$"../regaloB".play("abrir")
	tiemporegalo.wait_time=1
	tiemporegalo.start()
	pass # Replace with function body.

func _on_arearegaloc_body_entered(body):
	pass # Replace with function body.

func _on_regalos_timeout():
	tiemporegalo.stop()
	$"../regaloB".stop()
	$"../regaloB".hide()
	pass # Replace with function body.
