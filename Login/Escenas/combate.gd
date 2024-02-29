extends Node2D
var tiempo_restante = 10
var timer
var respondio=false
var respondiobien=0
var respondiomal=0
var rondas
var velocidad = Vector2(100, 0)  # Velocidad inicial en píxeles por segundo
var direccion = Vector2.RIGHT
var tiempoRonda=4
var cantrondas=1
var contarrondas=1
# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.text = "Ronda "+str(cantrondas)+"\n"
	timer=$tiempocontestar
	rondas=$timerrondas
	rondas.start()
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if contarrondas==3:
		ocultarpregunta()
		contarrondas=1
	pass


func _on_tiempocontestar_timeout():
	tiempo_restante -= 1
	if tiempo_restante > 0:
		$lbtiempo.text = "Tiempo restante: " + str(tiempo_restante) + " segundos"
	else:
		if respondio==false:
			$lbtiempo.text = "Tiempo agotado"
		#$Node2D.next_text()
		contarrondas+=1
		tiempo_restante = 10
		respondiomal+=1
		empate()
	pass # Replace with function body.


func _on_button_pressed():
	if $Node2D.valor==0	:
		print("respuesta correcta")
		respondio=true
		tiempo_restante = 10
		respondiobien+=1
		#$"captain america/CA1".play("ataque")
		#$"Spidey/spidey".play("dead")
		#$capitan/CA1.play("ataque")
		contarrondas+=1
		empate()
	else:
		respondio=false
		#$Node2D.next_text()
		contarrondas+=1
		tiempo_restante = 10
		respondiomal+=1
		empate()
	pass # Replace with function body.


func _on_button_2_pressed():
	if $Node2D.valor==1 || $Node2D.valor==3:
		respondio=true
		contarrondas+=1
		tiempo_restante = 10
		respondiobien+=1
		empate()
	else:
		print("respuesta incorrecta")
		respondio=false
		#$Node2D.next_text()
		contarrondas+=1
		tiempo_restante = 10
		respondiomal+=1
		empate()
	pass # Replace with function body.


func _on_button_3_pressed():
	if  $Node2D.valor!=1 &&  $Node2D.valor!=0 &&  $Node2D.valor!=3:
		respondio=true
		contarrondas+=1
		tiempo_restante = 10
		respondiobien+=1
		empate()
	else:
		print("respuesta incorrecta")
		respondio=false
		#$Node2D.next_text()
		contarrondas+=1
		tiempo_restante = 10
		respondiomal+=1
		empate()
	pass # Replace with function body.


func _on_button_4_pressed():
	print("respuesta incorrecta")
	tiempo_restante = 10
	respondio=false
	#$Node2D.next_text()
	contarrondas+=1
	respondiomal+=1
	#$Node2D.next_text()
	empate()
	pass # Replace with function body.


func _on_timerrondas_timeout():
	
	tiempoRonda -= 1
	if tiempoRonda > 0:
		$Label.text = "Ronda "+str(cantrondas)+"\n"+ "       "+str(tiempoRonda) 
		tiempo_restante = 10
	else:
			timer.start()
			$Node2D.show()
			$Button.show()
			$Button2.show()
			$Button3.show()
			$Button4.show()
			$lbtiempo.show()
			$Label.hide()
	pass # Replace with function body.

func ocultarpregunta():
	
	cantrondas+=1
	tiempoRonda=4
	rondas.start()
	$Node2D.hide()
	$Button.hide()
	$Button2.hide()
	$Button3.hide()
	$Button4.hide()
	$Label.show()
	$lbtiempo.hide()
	tiempo_restante = 10
	print("bien ",respondiobien," mal ",respondiomal)
	
func empate():
	if respondiobien==respondiomal:
		$Node2D.valor=-1
		$Node2D.current_text=-1
		print("empate")
	$Node2D.next_text()
