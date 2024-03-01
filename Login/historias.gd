extends Node2D
var time
var mysterio1
var positions=0
func _ready():
	time=$Timer
	mysterio1=$mysterio_time
	$fire_continously.play()
	$AudioStreamPlayer.play()
	$RespuestaA_1/fuegito.play("explosion")
	$RespuestaB_1/fuegito1.play("explosion")
	$RespuestaC_1/fuegito_correct1.play("explosion")
	$RespuestaD_1/fuegito2.play("explosion")
	$RespuestaA_2/fuegito3.play("explosion")
	$RespuestaB_2/fuegito_correct2.play("explosion")
	$RespuestaC_2/fuegito4.play("explosion")
	$RespuestaD_2/fuegito5.play("explosion")
	$RespuestaA_3/fuegito_correct3.play("explosion")
	$RespuestaB_3/fuegito6.play("explosion")
	$RespuestaC_3/fuegito7.play("explosion")
	$RespuestaD_3/fuegito8.play("explosion")
	$RespuestaA_4/fuegito9.play("explosion")
	$RespuestaB_4/fuegito_correct4.play("explosion")
	$RespuestaC_4/fuegito10.play("explosion")
	$RespuestaD_4/fuegito11.play("explosion")
	$RespuestaA_5/fuegito_correct5.play("explosion")
	$RespuestaB_5/fuegito12.play("explosion")
	$RespuestaC_5/fuegito13.play("explosion")
	$RespuestaD_5/fuegito14.play("explosion")
func _process(delta):
	if Input.is_action_just_pressed("x"): 
			$CharacterBody2D2.show()
			time.stop() 
			time.wait_time = 2.5
			$CharacterBody2D2.hide()
func _on_button_pressed():
	$AudioStreamPlayer.stop()
	get_tree().change_scene_to_file("res://Escenas/inicioworld.tscn")
	Saveus.finished_game+=1

func _on_area_2d_body_entered(body):
	if body.is_in_group("player2"):
			$PrimeraPregunta/CollisionShape2D/Camera2D.make_current()
			DialogueManager.show_dialogue_balloon(load("res://Scripts/primerapregunta.dialogue"), "first_question")



func _on_respuesta_c_1_body_entered(body):
	if body.is_in_group("player2"):
		$fire_Extinguisher.play()
		$RespuestaC_1/fuegito_correct1.hide()
		Saveus.right_answer1=true
			

func _on_segunda_pregunta_2_body_entered(body):
	if body.is_in_group("player2"):
			$SegundaPregunta2/CollisionShape2D/Camera2D.make_current()
			DialogueManager.show_dialogue_balloon(load("res://Scripts/Segunda_pregunta.dialogue"), "second_question")


func _on_respuesta_b_2_body_entered(body):
	if body.is_in_group("player2"):
		$fire_Extinguisher.play()
		$RespuestaB_2/fuegito_correct2.hide()
		Saveus.right_answer2=true


func _on_tercera_pregunta_2_body_entered(body):
	if body.is_in_group("player2"):
			$TerceraPregunta2/CollisionShape2D/Camera2D.make_current()
			DialogueManager.show_dialogue_balloon(load("res://Scripts/tercera_pregunta.dialogue"), "third_question")


func _on_respuesta_a_3_body_entered(body):
	if body.is_in_group("player2"):
		$fire_Extinguisher.play()
		$RespuestaA_3/fuegito_correct3.hide()
		Saveus.right_answer3=true

func _on_cuarta_pregunta_2_body_entered(body):
	if body.is_in_group("player2"):
			$CuartaPregunta2/CollisionShape2D/Camera2D.make_current()
			DialogueManager.show_dialogue_balloon(load("res://Scripts/cuarta_pregunta.dialogue"),"fourth_question")


func _on_respuesta_b_4_body_entered(body):
	if body.is_in_group("player2"):
		$fire_Extinguisher.play()
		$RespuestaB_4/fuegito_correct4.hide()
		Saveus.right_answer4=true

func _on_quinta_pregunta_2_body_entered(body):
	if body.is_in_group("player2"):
		$QuintaPregunta2/CollisionShape2D/Camera2D.make_current()
		DialogueManager.show_dialogue_balloon(load("res://Scripts/quinta_pregunta.dialogue"),"fifth_question")


func _on_respuesta_a_5_body_entered(body):
	if body.is_in_group("player2"):
			DialogueManager.show_dialogue_balloon(load("res://Scripts/respuesta_final.dialogue"), "final_answer")
			$fire_Extinguisher.play()
			$RespuestaA_5/fuegito_correct5.hide()
			Saveus.right_answer5=true



func _on_respuesta_a_1_body_entered(body):
	if body.is_in_group("player2"):
		$CharacterBody2D/Camera2D2.make_current()
		Saveus.caida = true
		time.stop() 
		time.wait_time = 1.5
		$explosion.play()
		$CharacterBody2D.position = Saveus.initial_position


func _on_respuesta_b_1_body_entered(body):
	if body.is_in_group("player2"):
		$CharacterBody2D/Camera2D2.make_current()
		Saveus.caida = true
		time.stop() 
		time.wait_time = 1.5
		$explosion.play()
		$CharacterBody2D.position = Saveus.initial_position

func _on_respuesta_d_1_body_entered(body):
	$CharacterBody2D/Camera2D2.make_current()
	if body.is_in_group("player2"):
		Saveus.caida = true
		time.stop() 
		time.wait_time = 1.5
		$explosion.play()
		$CharacterBody2D.position = Saveus.initial_position

func _on_respuesta_a_2_body_entered(body):
	$CharacterBody2D/Camera2D2.make_current()
	if body.is_in_group("player2"):
		Saveus.caida = true
		time.stop() 
		time.wait_time = 1.5
		$explosion.play()
		$CharacterBody2D.position = Saveus.initial_position


func _on_respuesta_c_2_body_entered(body):
	$CharacterBody2D/Camera2D2.make_current()
	if body.is_in_group("player2"):
		Saveus.caida = true
		time.stop() 
		time.wait_time = 1.5
		$explosion.play()
		$CharacterBody2D.position = Saveus.initial_position


func _on_respuesta_d_2_body_entered(body):
	$CharacterBody2D/Camera2D2.make_current()
	if body.is_in_group("player2"):
		Saveus.caida = true
		time.stop() 
		time.wait_time = 1.5
		$explosion.play()
		$CharacterBody2D.position = Saveus.initial_position


func _on_respuesta_b_3_body_entered(body):
	$CharacterBody2D/Camera2D2.make_current()
	if body.is_in_group("player2"):
		Saveus.caida = true
		time.stop() 
		time.wait_time = 1.5
		$explosion.play()
		$CharacterBody2D.position = Saveus.initial_position


func _on_respuesta_c_3_body_entered(body):
	$CharacterBody2D/Camera2D2.make_current()
	if body.is_in_group("player2"):
		Saveus.caida = true
		time.stop() 
		time.wait_time = 1.5
		$explosion.play()
		$CharacterBody2D.position = Saveus.initial_position


func _on_respuesta_d_3_body_entered(body):
	$CharacterBody2D/Camera2D2.make_current()
	if body.is_in_group("player2"):
		Saveus.caida = true
		time.stop() 
		time.wait_time = 1.5
		$explosion.play()
		$CharacterBody2D.position = Saveus.initial_position

func _on_respuesta_a_4_body_entered(body):
	$CharacterBody2D/Camera2D2.make_current()
	if body.is_in_group("player2"):
		Saveus.caida = true
		time.stop() 
		time.wait_time = 1.5
		$explosion.play()
		$CharacterBody2D.position = Saveus.initial_position


func _on_respuesta_c_4_body_entered(body):
	$CharacterBody2D/Camera2D2.make_current()
	if body.is_in_group("player2"):
		Saveus.caida = true
		time.stop() 
		time.wait_time = 1.5
		$explosion.play()
		$CharacterBody2D.position = Saveus.initial_position



func _on_respuesta_d_4_body_entered(body):
	$CharacterBody2D/Camera2D2.make_current()
	if body.is_in_group("player2"):
		Saveus.caida = true
		time.stop() 
		time.wait_time = 1.5
		$explosion.play()
		$CharacterBody2D.position = Saveus.initial_position


func _on_respuesta_b_5_body_entered(body):
	$CharacterBody2D/Camera2D2.make_current()
	if body.is_in_group("player2"):
		Saveus.caida = true
		time.stop() 
		time.wait_time = 1.5
		$explosion.play()
		$CharacterBody2D.position = Saveus.initial_position

func _on_respuesta_c_5_body_entered(body):
	$CharacterBody2D/Camera2D2.make_current()
	if body.is_in_group("player2"):
		Saveus.caida = true
		time.stop() 
		time.wait_time = 1.5
		$explosion.play()
		$CharacterBody2D.position = Saveus.initial_position

func _on_respuesta_d_5_body_entered(body):
	$CharacterBody2D/Camera2D2.make_current()
	if body.is_in_group("player2"):
		Saveus.caida = true
		time.stop() 
		time.wait_time = 1.5
		$explosion.play()
		$CharacterBody2D.position = Saveus.initial_position


func _on_final_body_entered(body):
	if Saveus.right_answer5==true:
		$fire_continously.stop()
		$CharacterBody2D2.show() 
		mysterio1.wait_time = 2.5
		mysterio1.start()
		$punch.play()
		Saveus.win_spidey=true
		Saveus.mysterio=true
		DialogueManager.show_dialogue_balloon(load("res://gamefinishdialogue.dialogue"), "final_dialogue")
		$Button.show()
		


func _on_mysterio_time_timeout():
	mysterio1.stop()
	$CharacterBody2D2.hide() 
