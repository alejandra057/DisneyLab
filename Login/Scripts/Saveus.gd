extends Node

const ARCHIVO="user://Usuarios.xd"

var nombre :String
var password: String
var texto
var selecmorado=false
var selectnara=false
var selectazul=false
var selectrosa=false
var contarmorado=0
var contarnara=0
var contarazul=0
var contarrosa=0
var contarpalabra=0
var posicioninicial=0
func _ready():
	cargar()
	pass # Replace with function body.

func cargar():
	var file = FileAccess.open(ARCHIVO, FileAccess.READ)
	if file != null:
		while !file.eof_reached():
			var linea = file.get_line().strip_edges() 
			if linea != "":
				var datos = linea.split(" ") 
				if datos.size() == 2:
					nombre = datos[0]
					password = datos[1]
					print("nombre: ", nombre, " contra: ", password)
		file.close()
	else:
		print("Archivo no encontrado.")
		
func guardaruser(name: String, contra: String):
	var file = FileAccess.open(ARCHIVO, FileAccess.READ_WRITE)
	file.seek_end()
	if !verificaruser(name):
		file.store_line(name + " " + contra)  
	file.close()
	

func verificaruser(user: String):
	var file = FileAccess.open(ARCHIVO, FileAccess.READ)
	while !file.eof_reached():
		var linea = file.get_line().strip_edges()
		if linea != "":
			var datos = linea.split(" ")
			if datos.size() == 2:
				var nombre_actual = datos[0]
				var contra_actual = datos[1]
				if user == nombre_actual:
					return true
	file.close()
	return false

func iniciosesion(user: String,contra: String):
	var file = FileAccess.open(ARCHIVO, FileAccess.READ)
	while !file.eof_reached():
		var linea = file.get_line().strip_edges()
		if linea != "":
			var datos = linea.split(" ")
			if datos.size() == 2:
				var nombre_actual = datos[0]
				var contra_actual = datos[1]
				print("nombre: ", nombre_actual, " contra: ", contra_actual)
				if user == nombre_actual: 
					if contra==contra_actual:
						print("Usuario encontrado:", user, " Contraseña:", contra_actual)
					else:
						texto="Contraseña incorrecta"
						return false
					return true
	file.close()
	texto="Usuario Inexistente"
	return false

func _process(delta):
	pass

