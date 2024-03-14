extends Node2D


var velocidad = 0
var encendido = false
var contar = 0
#var opciones = [3{"nombre": "Politica", "probabilidad": 0.5}, {"nombre": "Ciencia", "probabilidad": 0.5}, {"nombre": "Arte", "probabilidad": 0.5}, {"nombre": "Historia", "probabilidad": 0.5}]
var lbpolitica : Label
var lbciencia : Label
var lbarte: Label
var lbhistoria : Label
var texto : Label
var tiempoextra = 0
var timer : Timer
var rotacion : Node2D
var estado

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	lbpolitica = $lbpolitica
	lbciencia = $lbciencia
	lbarte = $lbarte
	lbhistoria = $lbhistoria
	texto = $"../lbanuncio"
	timer = $"../Timer"
	rotacion = $"."
	lbpolitica.hide()
	lbciencia.hide()
	lbarte.hide()
	lbhistoria.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if encendido:
		rotacion.rotation_degrees += velocidad * delta
		if velocidad > 0:
			velocidad -= 20 * delta
		else:
			encendido = false
			mostrar_opcion()
	if Input.is_action_just_pressed("space bar"):
		girar_ruleta()


func girar_ruleta():
	if not encendido:
		encendido = true
		velocidad = randf_range(200, 220)
		Saveus.seleccion_actual = seleccionar_opcion()
		timer.set_wait_time(2)
		timer.start()

func seleccionar_opcion():
	var opciones_validas = []
	for opcion in Saveus.opciones:
		if opcion != Saveus.seleccion_actual:
			opciones_validas.append(opcion)
	var total_probabilidad = 0
	for opcion in opciones_validas:
		total_probabilidad += opcion["probabilidad"]
	var random_value = randf() * total_probabilidad
	var suma_probabilidad = 0
	for opcion in opciones_validas:
		suma_probabilidad += opcion["probabilidad"]
		if random_value < suma_probabilidad:
			Saveus.seleccion_actual = opcion
			Saveus.opciones_seleccionadas.append(opcion)
			opcion["probabilidad"] = 0
			return opcion
	return opciones_validas[-1]

func mostrar_opcion():
	match Saveus.seleccion_actual["nombre"]:
		"Politica":
			lbpolitica.show()
			texto.text = "CATEGORIA\nPOLITICA"
			Saveus.selectazul=true;
		"Ciencia":
			lbciencia.show()
			texto.text = "CATEGORIA\nCIENCIA"
			Saveus.selectnara=true;
		"Arte":
			lbarte.show()
			texto.text = "CATEGORIA\nARTE"
			Saveus.selectrosa=true
		"Historia":
			lbhistoria.show()
			texto.text = "CATEGORIA\nHISTORIA"
			Saveus.selecmorado=true
			
