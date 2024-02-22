extends Node2D
var ruleta= ""
func _process(delta):
	if Input.is_action_just_pressed("e"):
		get_tree().change_scene_to_file(ruleta)
		
func _on_area_2d_body_entered(body):
	if body.is_in_group("player1"):
		ruleta ="res://Escenas/EscenaPrincipal.tscn"
		
