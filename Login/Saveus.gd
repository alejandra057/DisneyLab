extends Node

const ARCHIVO="user://Usuarios.xd"
var opciones_seleccionadas = []
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
var contarpregunta=0
var posicioninicial=0
var initial_position = Vector2(320,10)
var caida=false
var pregunta0=false
var pregunta1=false
var pregunta2=false
var pregunta3=false
var pregunta4=false
var pregunta5=false
var pregunta6=false
var opciones = [{"nombre": "Politica", "probabilidad": 0.2}, {"nombre": "Ciencia", "probabilidad": 0.8}, {"nombre": "Arte", "probabilidad": 0.3}, {"nombre": "Historia", "probabilidad": 0.7}]
var seleccion_actual=null
var right_answer1=false
var right_answer2=false
var right_answer3=false
var right_answer4=false
var right_answer5=false
var habilitar=false
var capitan=false
var iron_man=false
var win_spidey=false
var mysterio=false
var contadorcapi=0
var contadoriron=0
var bandoelegido=false
var finished_game=0
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

