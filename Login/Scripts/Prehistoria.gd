extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	DialogueManager.show_dialogue_balloon(load("res://Scripts/Dialogo_prehistoria.dialogue"), "prehistoria")



func _process(delta):
	pass


func _on_button_pressed():
	get_tree().change_scene_to_file("res://historia.tscn")

