extends Node2D
var tiempo_restante = 10
var timer
var respondio=false

# Called when the node enters the scene tree for the first time.
func _ready():
	timer=$tiempocontestar
	timer.start()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	pass


func _on_tiempocontestar_timeout():
	tiempo_restante -= 1
	if tiempo_restante > 0:
		$lbtiempo.text = "Tiempo restante: " + str(tiempo_restante) + " segundos"
	else:
		if respondio==false:
			$lbtiempo.text = "Tiempo agotado"
	pass # Replace with function body.


func _on_button_pressed():
	if $Node2D.valor==0	:
		print("respuesta correcta")
		Saveus.contarpalabra+=1
		$Node2D.next_text()
		respondio=true
	else:
		respondio=false
		tiempo_restante=0
	Saveus.contarpalabra=0
	pass # Replace with function body.


func _on_button_2_pressed():
	
	if $Node2D.valor==1	:
		Saveus.contarpalabra+=1
		timer.start()
		respondio=true
	else:
		print("respuesta incorrecta")
		respondio=false
		tiempo_restante=0
	Saveus.contarpalabra=0
	pass # Replace with function body.


func _on_button_3_pressed():
	pass # Replace with function body.


func _on_button_4_pressed():
	pass # Replace with function body.
