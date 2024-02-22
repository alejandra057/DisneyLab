extends Node2D
var time
var positions=0
func _ready():
	time=$Timer
func _process(delta):
	pass

func _on_button_pressed():
	get_tree().change_scene_to_file("res://Escenas/inicioworld.tscn")


func _on_area_2d_body_entered(body):
	if body.is_in_group("player2"):
			DialogueManager.show_dialogue_balloon(load("res://Scripts/primerapregunta.dialogue"), "first_question")



func _on_respuesta_c_1_body_entered(body):
	if body.is_in_group("player2"):
			DialogueManager.show_dialogue_balloon(load("res://Scripts/RepuestaCorrecta_signal.dialogue"), "right_answer")
			Saveus.right_answer1=true

func _on_segunda_pregunta_2_body_entered(body):
	if body.is_in_group("player2"):
			DialogueManager.show_dialogue_balloon(load("res://Scripts/Segunda_pregunta.dialogue"), "second_question")


func _on_respuesta_b_2_body_entered(body):
	if body.is_in_group("player2"):
			DialogueManager.show_dialogue_balloon(load("res://Scripts/RepuestaCorrecta_signal.dialogue"), "right_answer")
			Saveus.right_answer2=true


func _on_tercera_pregunta_2_body_entered(body):
	if body.is_in_group("player2"):
			DialogueManager.show_dialogue_balloon(load("res://Scripts/tercera_pregunta.dialogue"), "third_question")


func _on_respuesta_a_3_body_entered(body):
	if body.is_in_group("player2"):
			DialogueManager.show_dialogue_balloon(load("res://Scripts/RepuestaCorrecta_signal.dialogue"), "right_answer")
			Saveus.right_answer3=true

func _on_cuarta_pregunta_2_body_entered(body):
	if body.is_in_group("player2"):
			DialogueManager.show_dialogue_balloon(load("res://Scripts/cuarta_pregunta.dialogue"),"fourth_question")


func _on_respuesta_b_4_body_entered(body):
	if body.is_in_group("player2"):
			DialogueManager.show_dialogue_balloon(load("res://Scripts/RepuestaCorrecta_signal.dialogue"), "right_answer")
			Saveus.right_answer4=true

func _on_quinta_pregunta_2_body_entered(body):
	if body.is_in_group("player2"):
			DialogueManager.show_dialogue_balloon(load("res://Scripts/quinta_pregunta.dialogue"),"fifth_question")


func _on_respuesta_a_5_body_entered(body):
	if body.is_in_group("player2"):
			DialogueManager.show_dialogue_balloon(load("res://Scripts/respuesta_final.dialogue"), "final_answer")
			Saveus.right_answer5=true



func _on_respuesta_a_1_body_entered(body):
	if body.is_in_group("player2"):
		$RespuestaA_1/fuegito.show()
		$RespuestaA_1/fuegito.play("explosion")
		Saveus.caida = true
		time.stop() 
		time.wait_time = 1.5
		$CharacterBody2D.position = Saveus.initial_position


func _on_respuesta_b_1_body_entered(body):
	if body.is_in_group("player2"):
		$RespuestaB_1/fuegito1.show()
		$RespuestaB_1/fuegito1.play("explosion")
		Saveus.caida = true
		time.stop() 
		time.wait_time = 1.5
		$CharacterBody2D.position = Saveus.initial_position

func _on_respuesta_d_1_body_entered(body):
	if body.is_in_group("player2"):
		$RespuestaD_1/fuegito2.show()
		$RespuestaD_1/fuegito2.play("explosion")
		Saveus.caida = true
		time.stop() 
		time.wait_time = 1.5
		$CharacterBody2D.position = Saveus.initial_position

func _on_respuesta_a_2_body_entered(body):
	if body.is_in_group("player2"):
		$RespuestaA_2/fuegito3.show()
		$RespuestaA_2/fuegito3.play("explosion")
		Saveus.caida = true
		time.stop() 
		time.wait_time = 1.5
		$CharacterBody2D.position = Saveus.initial_position


func _on_respuesta_c_2_body_entered(body):
	if body.is_in_group("player2"):
		$RespuestaC_2/fuegito4.show()
		$RespuestaC_2/fuegito4.play("explosion")
		Saveus.caida = true
		time.stop() 
		time.wait_time = 1.5
		$CharacterBody2D.position = Saveus.initial_position


func _on_respuesta_d_2_body_entered(body):
	if body.is_in_group("player2"):
		$RespuestaD_2/fuegito5.show()
		$RespuestaD_2/fuegito5.play("explosion")
		Saveus.caida = true
		time.stop() 
		time.wait_time = 1.5
		$CharacterBody2D.position = Saveus.initial_position


func _on_respuesta_b_3_body_entered(body):
	if body.is_in_group("player2"):
		$RespuestaB_3/fuegito6.show()
		$RespuestaB_3/fuegito6.play("explosion")
		Saveus.caida = true
		time.stop() 
		time.wait_time = 1.5
		$CharacterBody2D.position = Saveus.initial_position


func _on_respuesta_c_3_body_entered(body):
	if body.is_in_group("player2"):
		$RespuestaC_3/fuegito7.show()
		$RespuestaC_3/fuegito7.play("explosion")
		Saveus.caida = true
		time.stop() 
		time.wait_time = 1.5
		$CharacterBody2D.position = Saveus.initial_position


func _on_respuesta_d_3_body_entered(body):
	if body.is_in_group("player2"):
		$RespuestaD_3/fuegito8.show()
		$RespuestaD_3/fuegito8.play("explosion")
		Saveus.caida = true
		time.stop() 
		time.wait_time = 1.5
		$CharacterBody2D.position = Saveus.initial_position

func _on_respuesta_a_4_body_entered(body):
	if body.is_in_group("player2"):
		$RespuestaA_4/fuegito9.show()
		$RespuestaA_4/fuegito9.play("explosion")
		Saveus.caida = true
		time.stop() 
		time.wait_time = 1.5
		$CharacterBody2D.position = Saveus.initial_position


func _on_respuesta_c_4_body_entered(body):
	if body.is_in_group("player2"):
		$RespuestaC_4/fuegito10.show()
		$RespuestaC_4/fuegito10.play("explosion")
		Saveus.caida = true
		time.stop() 
		time.wait_time = 1.5
		$CharacterBody2D.position = Saveus.initial_position



func _on_respuesta_d_4_body_entered(body):
	if body.is_in_group("player2"):
		$RespuestaD_4/fuegito11.show()
		$RespuestaD_4/fuegito11.play("explosion")
		Saveus.caida = true
		time.stop() 
		time.wait_time = 1.5
		$CharacterBody2D.position = Saveus.initial_position


func _on_respuesta_b_5_body_entered(body):
	if body.is_in_group("player2"):
		$RespuestaB_5/fuegito12.show()
		$RespuestaB_5/fuegito12.play("explosion")
		Saveus.caida = true
		time.stop() 
		time.wait_time = 1.5
		$CharacterBody2D.position = Saveus.initial_position

func _on_respuesta_c_5_body_entered(body):
	if body.is_in_group("player2"):
		$RespuestaC_5/fuegito13.show()
		$RespuestaC_5/fuegito13.play("explosion")
		Saveus.caida = true
		time.stop() 
		time.wait_time = 1.5
		$CharacterBody2D.position = Saveus.initial_position

func _on_respuesta_d_5_body_entered(body):
	if body.is_in_group("player2"):
		$RespuestaD_5/fuegito14.show()
		$RespuestaD_5/fuegito14.play("explosion")
		Saveus.caida = true
		time.stop() 
		time.wait_time = 1.5
		$CharacterBody2D.position = Saveus.initial_position


func _on_final_body_entered(body):
	if Saveus.right_answer5==true:
		DialogueManager.show_dialogue_balloon(load("res://gamefinishdialogue.dialogue"), "final_dialogue")
		$Button.show()


	
	
