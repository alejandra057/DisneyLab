extends Node2D
var tiempo_restante = 10
var timer
var respondio=false
var respondiobien=0
var respondiomal=0
var rondas
var velocidad = Vector2(100, 0) 
var direccion = Vector2.RIGHT
var tiempoRonda=4
var cantrondas=1
var contarrondas=0
var escudo
var telarana
var animation_time
var animation_time2
var vida0
var vida1
var vida2
var vida3
var vida4
var vida_actual=4
var contador=0
var mostrarmsj=false
var puntosganador=0
var puntosperdedor=0
var progreso
# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.text = "Ronda "+str(cantrondas)+"\n"
	timer=$tiempocontestar
	rondas=$timerrondas
	rondas.start()
	animation_time=$animacion
	animation_time2=$animacion2
	vida0=$vida0
	vida1=$vida1
	vida2=$vida2
	vida3=$vida3
	vida4=$vida4
	#$ProgressBar.value=Saveus.progreso_game
	if Saveus.iron_man==true:
		$Bandoelegido2.show()
	elif Saveus.capitan==true:
		$Bandoelegido.show()
	pass # Replace with function body.
func animacion_ganar():
	if Saveus.capitan==true:
		$hulk/hulk.play("ataque")
		$thor/thor.play("dead")
		animation_time.wait_time = 1.5  
		animation_time.start()
		puntosganador+=1
		$punto1.text="Puntos: "+str(puntosganador)
	elif Saveus.iron_man==true:
		$thor/thor.play("ataque")
		$thor/AnimatedSprite2D.show()
		$thor/AnimatedSprite2D2.play("new_animation")
		$hulk/hulk.play("dead")
		animation_time.wait_time = 1.5 
		animation_time.start()
		puntosganador+=1
		$punto2.text="Puntos: "+str(puntosganador)
func animacion_perder():
	if Saveus.capitan==true:
		$thor/thor.play("ataque")
		$thor/AnimatedSprite2D.show()
		$thor/AnimatedSprite2D2.play("new_animation")
		$hulk/hulk.play("dead")
		animation_time2.wait_time = 1.5 
		animation_time2.start()
		puntosperdedor+=1
		$punto2.text="Puntos: "+str(puntosperdedor)
	elif Saveus.iron_man==true:
		$hulk/hulk.play("ataque")
		$thor/thor.play("dead")
		animation_time2.wait_time = 1.5  
		animation_time2.start()
		puntosperdedor+=1
		$punto1.text="Puntos: "+str(puntosperdedor)
		
func _process(delta):
	if contarrondas==1:
		print("enprocess contarronda")
		ocultarpregunta()
		contarrondas=0
		respondiomal=0
		respondiobien=0
	if respondiobien!=respondiomal && contador==2: 
		print("entra")
		ocultarpregunta()
		contador=0
	

		

func _on_tiempocontestar_timeout():
	tiempo_restante -= 1
	if tiempo_restante > 0:
		$lbtiempo.text = "Tiempo restante: " + str(tiempo_restante) + " segundos"
	else:
		if respondio==false:
			$lbtiempo.text = "Tiempo agotado"
		tiempo_restante = 10
		respondiomal+=1
		contador+=1
		animacion_perder()
	pass # Replace with function body.


func _on_button_pressed():
	contador+=1
	if mostrarmsj:
			print("entro al mostrar msj")
			contarrondas+=1
			mostrarmsj=false
	print("contador",contador)
	respondio=false
	tiempo_restante = 10
	respondiomal+=1
	animacion_perder()
		#perder_vidas()
	print("bien ",respondiobien," mal ",respondiomal)
	pass # Replace with function body.



func _on_button_2_pressed():
	contador+=1
	if mostrarmsj:
			print("entro al mostrar msj")
			contarrondas+=1
			mostrarmsj=false
	print("contador",contador)
	if $Node2D.valor==1:
		respondio=true
		tiempo_restante = 10
		animacion_ganar()
		#ganar_vidas()
		respondiobien+=1
		#empate()
		print("bien ",respondiobien," mal ",respondiomal)
		
	else:
		print("respuesta incorrecta")
		respondio=false
		#$Node2D.next_text()
		#contarrondas+=1
		tiempo_restante = 10
		animacion_perder()
		#perder_vidas()
		print("bien ",respondiobien," mal ",respondiomal)
		respondiomal+=1
		
	pass # Replace with function body.


func _on_button_3_pressed():
	contador+=1
	if mostrarmsj:
			contarrondas+=1
			mostrarmsj=false
	print("contador",contador)
	if  $Node2D.valor==0:
		respondio=true
		tiempo_restante = 10
		animacion_ganar()
		#ganar_vidas()
		respondiobien+=1
		#empate()
		print("bien ",respondiobien," mal ",respondiomal)
	else:
		print("respuesta incorrecta")
		print("bien ",respondiobien," mal ",respondiomal)
		respondio=false
		#$Node2D.next_text()
		#contarrondas+=1
		tiempo_restante = 10
		animacion_perder()
		#perder_vidas()
		respondiomal+=1
		
	pass # Replace with function body.


func _on_button_4_pressed():
	contador+=1
	print("respuesta incorrecta")
	print("bien ",respondiobien," mal ",respondiomal)
	tiempo_restante = 10
	respondio=false
	animacion_perder()
	#perder_vidas()
	respondiomal+=1
	if mostrarmsj:
			contarrondas+=1
			mostrarmsj=false
	pass # Replace with function body.


func _on_timerrondas_timeout():
	tiempoRonda -= 1
	$Label.text = ""
	if tiempoRonda > 0:
		$Label.text = "Ronda "+str(cantrondas)+"\n"+ "       "+str(tiempoRonda) 
		tiempo_restante = 10
	elif cantrondas<2:
			timer.start()
			$Node2D.show()
			$Button.show()
			$Button2.show()
			$Button3.show()
			$Button4.show()
			$lbtiempo.show()
			$Label.hide()
		
	pass 

func ocultarpregunta():
	cantrondas+=1
	print("cantrondas",cantrondas)
	if cantrondas>1:
		contarrondas=0
		print("aqui iria el ganador")
		if Saveus.capitan==true && puntosganador>1:
			$ganador.text ="Los empiristas han ganado el segundo combate"
			$hulk/hulk.play("victoria")
			Saveus.progreso_game+=25*100/100
		elif Saveus.iron_man==true && puntosganador>1:
			$ganador.text ="Los racionalistas han ganado el segundo combate"
			$thor/thor.play("victoria")
			Saveus.progreso_game+=25*100/100
		ocultar()
		return
	tiempoRonda=2
	rondas.start()
	ocultar()
	await get_tree().create_timer(10).timeout
	get_tree().change_scene_to_file("res://DialogoIn_2.tscn")
	tiempo_restante = 10
	print("bien ",respondiobien," mal ",respondiomal)

func empate():
	if respondiobien!=0 && respondiomal!=0:
		if respondiobien==respondiomal:
			$Node2D.valor-=1
			$Node2D.current_text-=1
			$Label.text = "Desempate "
			ocultarpregunta()
			cantrondas-=1
			print("empate")
			mostrarmsj=true
			contador=-1
	$Node2D.next_text()

func ocultar():
	$Node2D.hide()
	$Button.hide()
	$Button2.hide()
	$Button3.hide()
	$Button4.hide()
	$Label.show()
	$lbtiempo.hide()
	


func _on_animacion_timeout():
	animation_time.stop()
	$hulk/hulk.stop()
	$hulk/hulk.play("idle")
	$thor/thor.stop()
	$thor/AnimatedSprite2D2.stop()
	$thor/AnimatedSprite2D.hide()
	$thor/thor.play("idle")
	empate()
	


func _on_animacion_2_timeout():
	animation_time2.stop()
	$hulk/hulk.stop()
	$hulk/hulk.play("idle")
	$thor/thor.stop()
	$thor/AnimatedSprite2D2.stop()
	$thor/AnimatedSprite2D.hide()
	$thor/thor.play("idle")
	empate()
	
