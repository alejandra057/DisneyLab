extends Control
var textuser: TextEdit
var textcontra: TextEdit
var informacion: Label

# Called when the node enters the scene tree for the first time.
func _ready():
	textcontra=$txtcontra
	textuser=$txtuser
	informacion=$lbinfo
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass




func _on_login_pressed():
	if textcontra.text.is_empty() or textuser.text.is_empty():
		informacion.text="CAMPOS VACIOS"
		print("campos vacios")
	else:
		var name=textuser.text
		var cont=textcontra.text
		if Saveus.iniciosesion(name,cont):
			informacion.text="BIENVENIDO"
			get_tree().change_scene_to_file("res://Escenas/Narrative.tscn")
			print("funciona")
		else:
			informacion.text=Saveus.texto
			print("user inexistente")
	pass # Replace with function body.


func _on_registro_pressed():
	get_tree().change_scene_to_file("res://Escenas/registro.tscn")
	pass 
