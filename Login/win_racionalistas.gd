extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$AudioStreamPlayer2D.play()
	DialogueManager.show_dialogue_balloon(load("res://racionalistas_gane.dialogue"),"racionalistas")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	get_tree().change_scene_to_file("res://adentro_uni.tscn")
