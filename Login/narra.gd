extends Node2D
class_name Start
const _DIALOG_SCREEN: PackedScene = preload("res://dialog_screen.tscn")
var _dialog_data: Dictionary = {
	0: {
		"faceset": "res://Art/Sprites/68585-mickey-goofy-mouse-minnie-pluto-png-free-photo-thumb.png",
		"dialog": "olaaaa",
		"tile": "Mickey"
		},
	1: {
		"faceset": "res://Art/Sprites/68585-mickey-goofy-mouse-minnie-pluto-png-free-photo-thumb.png",
		"dialog": "como estas",
		"tile": "Mickey Mouse"
		},
	2: {
		"faceset": "res://Art/Sprites/68585-mickey-goofy-mouse-minnie-pluto-png-free-photo-thumb.png",
		"dialog": "yo bien y tu?",
		"tile": "Mickey M"
		},
	3: {
		"faceset": "res://Art/Sprites/68585-mickey-goofy-mouse-minnie-pluto-png-free-photo-thumb.png",
		"dialog": "yo bien y tu?",
		"tile": "Micke"
		},
}
@export_category("Objects")
@export var _hud :CanvasLayer = null

func _process(_delta:float) -> void:
	if Input.is_action_just_pressed("ui_accept"): 
		var _new_dialog: DialogScreen = _DIALOG_SCREEN.instantiate()
		_new_dialog.data = _dialog_data
		_hud.add_child(_new_dialog)
		

