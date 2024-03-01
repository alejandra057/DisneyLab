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
# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.text = "Ronda "+str(cantrondas)+"\n"
	timer=$tiempocontestar
	rondas=$timerrondas
	rondas.start()
	escudo=$"captain america/disco/AnimationPlayer"
	animation_time=$animacion
	animation_time2=$animacion2
	telarana=$"Spidey/telaraña/AnimatedSprite2D"
	vida0=$vida0
	vida1=$vida1
	vida2=$vida2
	vida3=$vida3
	vida4=$vida4
	pass # Replace with function body.
func animacion_ganar():
	if Saveus.capitan==true:
		$"captain america/CA1".play("ataque")
		#escudo.show()
		escudo.play("disco")
		$ironman/ironman1.play("dead")
		animation_time.wait_time = 1.5  
		animation_time.start()
	elif Saveus.iron_man==true:
		$ironman/ironman1.play("ataque")
		$ironman/AnimatedSprite2D.show()
		$ironman/AnimatedSprite2D.play("laser")
		$"captain america/CA1".play("dead")
		animation_time.wait_time = 1.5 
		animation_time.start()
		
func animacion_perder():
	if Saveus.capitan==true:
		$ironman/ironman1.play("ataque")
		$ironman/AnimatedSprite2D.show()
		$ironman/AnimatedSprite2D.play("laser")
		$"captain america/CA1".play("dead")
		animation_time2.wait_time = 1.5 
		animation_time2.start()
	elif Saveus.iron_man==true:
		$"captain america/CA1".play("ataque")
		#escudo.show()
		escudo.play("disco")
		$ironman/ironman1.play("dead")
		animation_time2.wait_time = 1.5  
		animation_time2.start()
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if contarrondas==3:
		ocultarpregunta()
		contarrondas=1
	pass
func perder_vidas():
	if respondiomal==1 && Saveus.capitan ==true:
		$vida4.hide()
		vida_actual-=1
	elif respondiomal==2 && Saveus.capitan ==true:
		$vida3.hide()
		vida_actual-=1
	elif respondiomal ==3 && Saveus.capitan ==true:
		$vida2.hide()
		vida_actual-=1
	elif respondiomal ==4 && Saveus.capitan ==true:
		$vida1.hide()
		vida_actual-=1
		
func ganar_vidas():
	if respondiomal==1 && Saveus.capitan ==true && vida_actual==3:
		$vida04.show()
		vida_actual+=1
	elif respondiomal==2 && Saveus.capitan ==true && vida_actual==2:
		$vida03.show()
		vida_actual-=1
	elif respondiomal ==3 && Saveus.capitan ==true:
		$vida02.hide()
		vida_actual-=1
	elif respondiomal ==4 && Saveus.capitan ==true:
		$vida01.hide()
		vida_actual-=1
		

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
	if $Node2D.valor==0:
		print("respuesta correcta")
		respondio=true
		tiempo_restante = 10
		respondiobien+=1
		animacion_ganar()
		contarrondas+=1
		empate()
	else:
		respondio=false
		#$Node2D.next_text()
		contarrondas+=1
		tiempo_restante = 10
		respondiomal+=1
		animacion_perder()
		perder_vidas()
		empate()
	pass # Replace with function body.



func _on_button_2_pressed():
	if $Node2D.valor==1 || $Node2D.valor==3:
		respondio=true
		contarrondas+=1
		tiempo_restante = 10
		animacion_ganar()
		respondiobien+=1
		empate()
	else:
		print("respuesta incorrecta")
		respondio=false
		#$Node2D.next_text()
		contarrondas+=1
		tiempo_restante = 10
		animacion_perder()
		respondiomal+=1
		empate()
	pass # Replace with function body.


func _on_button_3_pressed():
	if  $Node2D.valor!=1 &&  $Node2D.valor!=0 &&  $Node2D.valor!=3:
		respondio=true
		contarrondas+=1
		tiempo_restante = 10
		animacion_ganar()
		respondiobien+=1
		empate()
	else:
		print("respuesta incorrecta")
		respondio=false
		#$Node2D.next_text()
		contarrondas+=1
		tiempo_restante = 10
		animacion_perder()
		respondiomal+=1
		empate()
	pass # Replace with function body.


func _on_button_4_pressed():
	print("respuesta incorrecta")
	tiempo_restante = 10
	respondio=false
	#$Node2D.next_text()
	contarrondas+=1
	animacion_perder()
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
		$Node2D.valor-1
		$Node2D.current_text-1
		print("empate")
	$Node2D.next_text()


func _on_animacion_timeout():
	animation_time.stop()
	$"captain america/CA1".stop()
	$"captain america/CA1".play("idle")
	$ironman/ironman1.stop()
	$ironman/AnimatedSprite2D.stop()
	$ironman/AnimatedSprite2D.hide()
	$ironman/ironman1.play("idle")
	escudo.stop()
	#escudo.hide()





func _on_animacion_2_timeout():
	animation_time2.stop()
	$"captain america/CA1".stop()
	$"captain america/CA1".play("idle")
	$ironman/ironman1.stop()
	$ironman/AnimatedSprite2D.stop()
	$ironman/AnimatedSprite2D.hide()
	$ironman/ironman1.play("idle")
	escudo.stop()
	#escudo.hide()
