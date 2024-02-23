extends Control

class Pregunta:
	var enunciado:String
	var opciones:Array
	var resp_correcta:int

var banco_de_preguntas:Array = []

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	agregar_pregunta("¿Cuál es la capital de Francia?", ["Madrid", "París", "Londres", "Berlín"], 2)
	agregar_pregunta("¿Cuál es el resultado de 2 + 2?", ["3", "4", "5", "6"], 2)
	agregar_pregunta("¿Cuál es el planeta más grande del sistema solar?", ["Tierra", "Marte", "Júpiter", "Venus"], 3)
	agregar_pregunta("¿Quién escribió Romeo y Julieta?", ["William Shakespeare", "Jane Austen", "Charles Dickens", "Homer"], 1)
	agregar_pregunta("¿En qué año se fundó la ONU?", ["1945", "1950", "1960", "1970"], 1)
	
	banco_de_preguntas.shuffle()
	
	var puntos: int = 0
	
	for pregunta in banco_de_preguntas:
		mostrarPregunta(pregunta)
		var respuesta_usuario: int = -1
		while respuesta_usuario < 1 or respuesta_usuario > 4:
			print("Elija la respuesta correcta (1-4): ")
			respuesta_usuario = int()
		if respuesta_usuario == pregunta.respuesta_correcta + 1:
			print("¡Respuesta correcta! Sumas 1 punto.")
			puntos += 1
		else:
			print("Respuesta incorrecta. La respuesta correcta era: " + str(pregunta.respuesta_correcta + 1))
			print("\n")
			print("Fin del cuestionario. Total de puntos: " + str(puntos))
	##if respuesta_usuario == pregunta.resp_correcta

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func agregar_pregunta(enunciado,opciones,resp_correcta):
	var nueva_pregunta=Pregunta.new()
	nueva_pregunta.enunciado = enunciado
	nueva_pregunta.opciones = opciones
	nueva_pregunta.resp_correcta = resp_correcta
	banco_de_preguntas.append(nueva_pregunta)

func mostrarPregunta(pregunta):
	print(pregunta.enunciado)
	for i in range(pregunta.opciones.size()):
		print(str(i + 1) + ". " + pregunta.opciones[i])






