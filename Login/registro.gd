extends Control
var txtusuario : TextEdit
var txtcontra : TextEdit
var informacion: Label
var us:String
var con:String
# Called when the node enters the scene tree for the first time.
func _ready():
	txtusuario = $User
	txtcontra =$passw
	informacion =$lbtext
	pass # Replace with function body.


func _process(delta):
	pass


func _on_registrar_pressed():
	if txtusuario.text.is_empty() or txtcontra.text.is_empty(): 
		informacion.text=" Campos vacios"
		print("Campos vacios")
		return
	else:
		Saveus.nombre=txtusuario.text
		Saveus.password=txtcontra.text
		us=txtusuario.text
		con=txtcontra.text
		if !Saveus.verificaruser(us):
			Saveus.guardaruser(us,con)
			informacion.text="Usuario Registrado"
		else:
			informacion.text="Usuario Existente"
		txtusuario.text=""
		txtcontra.text=""
		print("opcion")
	pass # Replace with function body.


func _on_regresar_pressed():
	get_tree().change_scene_to_file("res://login.tscn")
	pass # Replace with function body.
