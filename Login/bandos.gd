extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	DialogueManager.show_dialogue_balloon(load("res://bandos.dialogue"), "battle")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_empiristas_body_entered(body):
	if body.is_in_group("player"):
			Saveus.bandoelegido=true
			if (Saveus.bandoelegido==true):
				DialogueManager.show_dialogue_balloon(load("res://empiristas.dialogue"), "capi")
				$team_cap.show()
				Saveus.capitan=true
			else:
				DialogueManager.show_dialogue_balloon(load("res://bandoelegido_Capi.dialogue"), "teamcap")
				$team_ironman.hide()


func _on_racionalistas_body_entered(body):
	if body.is_in_group("player"):
			Saveus.bandoelegido=true
			if (Saveus.bandoelegido==true):
				DialogueManager.show_dialogue_balloon(load("res://racionalistas.dialogue"), "ironman")
				$team_ironman.show()
				Saveus.iron_man=true
				Saveus.bandoelegido=true
			else:
				DialogueManager.show_dialogue_balloon(load("res://bandoelegido_ironman.dialogue"), "teamironman")
				$team_cap.hide()
