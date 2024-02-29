extends CharacterBody2D

var temporizador
const speed= 300
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
var pieza1
var pieza2
var pieza3
var pieza4
var pieza5
var pieza6
var  cotext : int=0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var contar=0
func _ready():
	animacion=$AnimatedSprite2D
	temporizador = $"../Timer"
	$AnimatedSprite2D.play("frente")
	Saveus.posicioninicial=$".".position
	print("posicion ",posicioninicial)
	$"../Node2D2".hide()
	vida1=$"../TextureRect2"
	vida2=$"../TextureRect3"
	vida3=$"../TextureRect4"
	vida4=$"../TextureRect5"
	vida5=$"../TextureRect6"
	pieza1=$"../Pieza1"
	pieza2=$"../Pieza2"
	pieza3=$"../Pieza3"
	pieza4=$"../Pieza4"
	pieza5=$"../Pieza5"
	pieza6=$"../Pieza6"
	vida5.hide()
	vida4.hide()
	vida3.hide()
	vida2.hide()
	vida1.hide()
	pieza1.hide()
	pieza2.hide()
	pieza3.hide()
	pieza4.hide()
	pieza5.hide()
	pieza6.hide()
	print(contar)
	
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
	var anim = $AnimatedSprite2D

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
			anim.play("frente")
		elif  movement == 0:
			anim.play("frente")
			anim.stop()
	if dir == "up":
		anim.flip_h = false
		if movement ==1:
			anim.play("espalda")
		elif  movement == 0:
			anim.play("espalda")
			anim.stop()
		

func _on_button_pressed():
	Saveus.finished_game+=1
	get_tree().change_scene_to_file("res://Escenas/inicioworld.tscn")
	
	pass # Replace with function body.


func _on_area_b_body_entered(body):
	#print("pregutna ", $"../Node2D2".valor)
	#print("entro a area b")
	if $"../Node2D2".valor==2:
		print("pregunta ", $"../Node2D2".valor)
		Saveus.contarpalabra+=1
		$"../Node2D2"._process(body)
		vida3.show()
		pieza3.show()
		$"../mensaje".show()
		$"../mensaje".text="Respuesta Correcta"
		temporizador.wait_time = 1
		temporizador.start()
		
	elif $"../Node2D2".valor==3:
		print("entro a pregunta 4")
		Saveus.contarpalabra+=1
		$"../Node2D2"._process(body)
		vida4.show()
		vida3.hide()
		pieza4.show()
		$"../mensaje".show()
		$"../mensaje".text="Respuesta Correcta"
		temporizador.wait_time = 1
		temporizador.start()
		print($"../Node2D2".valor, "# de valor en prgunta 4")
	else:
			$"../mensaje".show()
			$"../mensaje".text="Respuesta Incorrecta de B"
			temporizador.wait_time = 1
			temporizador.start()
	
	print("pregunta ", $"../Node2D2".valor)
	Saveus.contarpalabra=0
	
pass # Replace with function body.

func _on_area_a_body_entered(body):
	if $"../Node2D2".valor == 0:
		Saveus.contarpalabra += 1
		$"../Node2D2"._process(body)
		$"../TextureRect".hide()
		vida1.show()
		pieza1.show()
		$"../mensaje".show()
		$"../mensaje".text="Respuesta Correcta"
		temporizador.wait_time = 1
		temporizador.start()
	
	elif $"../Node2D2".valor==1:
			print("pregutna ", $"../Node2D2".valor)
			Saveus.contarpalabra+=1
			$"../Node2D2"._process(body)
			vida2.show()
			pieza2.show()
			$"../mensaje".show()
			$"../mensaje".text="Respuesta Correcta"
			temporizador.wait_time = 1
			temporizador.start()
			print("valorrr ",$"../Node2D2".valor)
	elif $"../Node2D2".valor==4:
			print("entro a pregunta 5")
			vida5.show()
			vida4.hide()
			pieza5.show()
			pieza6.show()
			$"../mensaje".show()
			$"../mensaje".text="¡FELICIDADES!\nHaz ganado, puedes regresar al menu inicio"
			$"../mensaje/Button".show()
			#Saveus.contarpalabra+=1
			temporizador.stop()
	else:
			$"../mensaje".show()
			$"../mensaje".text="Respuesta Incorrecta de A"
			temporizador.wait_time = 1
			temporizador.start()
	print("pregutna ", $"../Node2D2".valor)
	Saveus.contarpalabra=0
	
	

func _on_area_d_body_entered(body):
	#contar+=1;
	$"../mensaje".show()
	$"../mensaje".text="Respuesta Incorrecta de d"
	$"../Node2D2"._process(body)
	Saveus.contarpalabra=0
	temporizador.wait_time = 1
	temporizador.start()
	
	pass # Replace with function body.

func _on_area_c_body_entered(body):
	#contar+=1;
	$"../mensaje".show()
	$"../mensaje".text="Respuesta Incorrecta de c"
	$"../Node2D2"._process(body)
	Saveus.contarpalabra=0
	temporizador.wait_time = 1
	temporizador.start()
	pass # Replace with function body.


func _on_pregunticas_body_entered(body):
	print("entro a preguntica")
	$"../Node2D2".show()
	pass # Replace with function body.



func _on_pregunticas_body_exited(body):
	$"../Node2D2".hide()
	pass # Replace with function body.


func _on_timer_timeout():
	print("entro a timer out")
	var mens = $"../mensaje"
	$".".position=Saveus.posicioninicial
	temporizador.stop()
	mens.hide()
	#if $"../Node2D2".valor==3:
		#$"../Node2D2".valor+=1
	pass # Replace with function body.
