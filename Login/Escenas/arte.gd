extends Node2D

var escena =""
var ruleta = ""
func _process(delta):
	if Input.is_action_just_pressed("a"):
		get_tree().change_scene_to_file(escena)
		
func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		escena ="res://Escenas/rapunzel.tscn"
		
func _input(event):
	if Input.is_action_just_pressed("e"):
		get_tree().change_scene_to_file(ruleta)


func _on_area_2d_2_body_entered(body):
	if body.is_in_group("player"):
		ruleta ="res://Escenas/EscenaPrincipal.tscn"
