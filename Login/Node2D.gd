extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$music.play()
	DialogueManager.show_dialogue_balloon(load("res://intro_batalla.dialogue"), "batalla")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	$music.stop()
	get_tree().change_scene_to_file("res://Escenas/combate.tscn")
