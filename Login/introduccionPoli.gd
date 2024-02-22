extends Node2D
var contar=0

# Called when the node enters the scene tree for the first time.
func _ready():
	DialogueManager.show_dialogue_balloon(load("res://intropoli.dialogue"),"introduccionpoli")
	if contar==2:
		print("probando")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("space bar"):
		contar+=1
		print("probando ",contar)
	if contar==2:
		$Gazellee.show()
		print("probando")
	if contar==3:
		$Gazellee.hide()
		$Oficial.show()
	if contar==4:
		$Oficial.hide()
		$Yax.show()
	if contar==5:
		$Yax.hide()
		$Mrbig.show()
	if contar==6:
		$Mrbig.hide()
	if contar==7:
		get_tree().change_scene_to_file("res://Escenas/zootopia.tscn")
	pass
