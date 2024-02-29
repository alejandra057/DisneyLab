extends Node2D
func _ready():
	DialogueManager.show_dialogue_balloon(load("res://bandos.dialogue"), "battle")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_empiristas_body_entered(body):
	if body.is_in_group("player"):
			#Saveus.bandoelegido=true
			if (Saveus.iron_man==false && Saveus.capitan==false):
				DialogueManager.show_dialogue_balloon(load("res://empiristas.dialogue"), "capi")
				$team_cap.show()
				Saveus.capitan=true
				$portal.show()
				$portal.play()
			else:
				DialogueManager.show_dialogue_balloon(load("res://bandoelegido_Capi.dialogue"), "teamcap")
				


func _on_racionalistas_body_entered(body):
	if body.is_in_group("player"):
			#Saveus.bandoelegido=true
			if (Saveus.iron_man==false && Saveus.capitan==false):
				DialogueManager.show_dialogue_balloon(load("res://racionalistas.dialogue"), "ironman")
				$team_ironman.show()
				Saveus.iron_man=true
				$portal.show()
				$portal.play()
			else:
				DialogueManager.show_dialogue_balloon(load("res://bandoelegido_Capi.dialogue"), "teamcap")
				


func _on_area_2d_body_entered(body):
	get_tree().change_scene_to_file("res://intro_combate.tscn")
	pass # Replace with function body.
