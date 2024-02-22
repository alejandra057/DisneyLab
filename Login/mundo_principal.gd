extends Node2D

var ruta= ""






func _process(delta):
	if Input.is_action_just_pressed("space bar"):
		get_tree().change_scene_to_file(ruta)
		
	


func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		ruta ="res://Escenas/inicioworld.tscn"
		
