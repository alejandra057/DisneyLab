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
var contador=0
var mostrarmsj=false
var puntosganador=0
var puntosperdedor=0
var animation_victory
var some_health_amount_s=150
var current_value_s:int
var max_value_s: int
var some_health_amount_d=150
var current_value_d:int
var max_value_d: int
var progreso
@onready var health_barS : ProgressBar=$CanvasLayer/ColorRect/HealthBarS
@onready var health_textS: RichTextLabel=$CanvasLayer/ColorRect/HealthBarS/RichTextLabel
@onready var health_barD : ProgressBar=$CanvasLayer2/ColorRect/HealthBarD
@onready var health_textD: RichTextLabel=$CanvasLayer2/ColorRect/HealthBarD/RichTextLabel
# Called when the node enters the scene tree for the first time.
func _ready():
	_update_health_bar_strange(1000,1000)
	_update_health_bar_spidey(1000,1000)
	$Label.text = "Ronda "+str(cantrondas)+"\n"
	timer=$tiempocontestar
	rondas=$timerrondas
	rondas.start()
	animation_time=$animacion
	animation_time2=$animacion2
	animation_victory=$animacion_ganar
	telarana=$"Spidey/telaraña/"
	$Progress_game.value=50
	
	if Saveus.iron_man==true:
		$Bandoelegido2.show()
	elif Saveus.capitan==true:
		$Bandoelegido.show()
	pass # Replace with function body.
	#vidas dr. strange
func _update_health_bar_strange(current_hp_d:int,max_hp_d:int)->void:
	current_value_d= current_hp_d
	max_value_d = max_hp_d
	health_barD.max_value=max_hp_d
	health_barD.value=current_hp_d
	health_textD.clear()
	health_textD.append_text("[center][b]%s/%s"% [current_hp_d,max_hp_d])
	
func _update_health_bar_color_strange(current_hp_d:int,max_hp_d:int)->void:
	if(current_hp_d > max_hp_d * 0.6):
		health_barD.set_theme_type_variation("HealthBar")
	elif(current_hp_d > max_hp_d * 0.3):
		health_barD.set_theme_type_variation("HealthBarMid")
	else:
		health_barD.set_theme_type_variation("HealthBarLow")
	
func add_health_strange()->void:
	current_value_d += some_health_amount_d
	if(current_value_d > max_value_d):
		current_value_d=max_value_d
	_update_health_bar_strange(current_value_d,max_value_d)
func reduce_health_strange()->void:
	current_value_d -=some_health_amount_d
	if(current_value_d <0):
		current_value_d=0
	_update_health_bar_strange(current_value_d,max_value_d)
	
	
#vidas spidey
func _update_health_bar_spidey(current_hp_s:int,max_hp_s:int)->void:
	current_value_s= current_hp_s
	max_value_s = max_hp_s
	health_barS.max_value=max_hp_s
	health_barS.value=current_hp_s
	health_textS.clear()
	health_textS.append_text("[center][b]%s/%s"% [current_hp_s,max_hp_s])
	
func _update_health_bar_color_spidey(current_hp_s:int,max_hp_s:int)->void:
	if(current_hp_s > max_hp_s * 0.6):
		health_barS.set_theme_type_variation("HealthBar")
	elif(current_hp_s > max_hp_s * 0.3):
		health_barS.set_theme_type_variation("HealthBarMid")
	else:
		health_barS.set_theme_type_variation("HealthBarLow")
func add_health_spidey()->void:
	current_value_s +=some_health_amount_s
	if(current_value_s > max_value_s):
		current_value_s=max_value_s
	_update_health_bar_spidey(current_value_s,max_value_s)
func reduce_health_spidey()->void:
	current_value_s -=some_health_amount_s
	if(current_value_s <0):
		current_value_s=0
	_update_health_bar_spidey(current_value_s,max_value_s)
	
#funcion ganar
func animacion_ganar():
	if Saveus.capitan==true:
		add_health_strange()
		$doctorStrnge/strange.play("ataque")
		$Spidey/spidey.play("dead")
		reduce_health_spidey()
		animation_time.wait_time = 1.5  
		animation_time.start()
		puntosganador+=1
		$punto1.text="Puntos: "+str(puntosganador)
	elif Saveus.iron_man==true:
		add_health_spidey()
		$Spidey/spidey.play("ataque")
		telarana.show()
		$"Spidey/telaraña/AnimatedSprite2D".play("telaraña")
		$doctorStrnge/strange.play("dead")
		reduce_health_strange()
		animation_time.wait_time = 1.5 
		animation_time.start()
		puntosganador+=1
		$punto2.text="Puntos: "+str(puntosganador)
#funcion perder
func animacion_perder():
	if Saveus.capitan==true:
		reduce_health_strange()
		$Spidey/spidey.play("ataque")
		telarana.show()
		$"Spidey/telaraña/AnimatedSprite2D".play("telaraña")
		$doctorStrnge/strange.play("dead")
		add_health_spidey()
		animation_time2.wait_time = 1.5 
		animation_time2.start()
		puntosperdedor+=1
		$punto2.text="Puntos: "+str(puntosperdedor)
	elif Saveus.iron_man==true:
		reduce_health_spidey()
		$doctorStrnge/strange.play("ataque")
		$Spidey/spidey.play("dead")
		add_health_strange()
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
	print("respuesta incorrecta")
	print("bien ",respondiobien," mal ",respondiomal)
	tiempo_restante = 10
	respondio=false
	animacion_perder()
	
	respondiomal+=1
	if mostrarmsj:
			contarrondas+=1
			mostrarmsj=false
	pass # Replace with fu




func _on_button_2_pressed():
	contador+=1
	print("respuesta incorrecta")
	print("bien ",respondiobien," mal ",respondiomal)
	tiempo_restante = 10
	respondio=false
	animacion_perder()
	
	respondiomal+=1
	if mostrarmsj:
			contarrondas+=1
			mostrarmsj=false
	pass # Replace with fu


func _on_button_3_pressed():
	contador+=1
	if mostrarmsj:
			print("entro al mostrar msj")
			contarrondas+=1
			mostrarmsj=false
	print("contador",contador)
	if $Node2D.valor==0 || $Node2D.valor==1:
		print("respuesta correcta")
		respondio=true
		tiempo_restante = 10
		respondiobien+=1
		animacion_ganar()
		print("bien ",respondiobien," mal ",respondiomal)
	else:
		respondio=false
		tiempo_restante = 10
		respondiomal+=1
		animacion_perder()
		print("bien ",respondiobien," mal ",respondiomal)
	pass


func _on_button_4_pressed():
	contador+=1
	print("respuesta incorrecta")
	print("bien ",respondiobien," mal ",respondiomal)
	tiempo_restante = 10
	respondio=false
	animacion_perder()
	
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
			$ganador.text ="Los empiristas han ganado el tercer combate "
			$doctorStrnge/strange.play("victoria")
			$Progress_game.value=75
		elif Saveus.iron_man==true && puntosganador>1:
			$ganador.text ="Los racionalista han ganado el tercer combate"
			$Spidey/spidey.play("victoria")
			$Progress_game.value=75
		ocultar()
	tiempoRonda=1
	rondas.start()
	ocultar()
	if Saveus.capitan==true && puntosganador==2 || Saveus.iron_man==true && puntosganador==2:
		await get_tree().create_timer(5).timeout
		get_tree().change_scene_to_file("res://intro_combate4.tscn")
	elif  Saveus.capitan==true && puntosperdedor>1 || Saveus.iron_man==true && puntosperdedor>1:
		$Perdistelb.show()
		$Backbtn.show()
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
	timer.stop()


func _on_animacion_timeout():
	animation_time.stop()
	$doctorStrnge/strange.stop()
	$doctorStrnge/strange.play("idle")
	$Spidey/spidey.stop()
	$"Spidey/telaraña/AnimatedSprite2D".stop()
	$"Spidey/telaraña/AnimatedSprite2D".hide()
	$Spidey/spidey.play("idle")
	telarana.hide()
	empate()
	


func _on_animacion_2_timeout():
	animation_time2.stop()
	$doctorStrnge/strange.stop()
	$doctorStrnge/strange.play("idle")
	$Spidey/spidey.stop()
	$"Spidey/telaraña/AnimatedSprite2D".stop()
	$"Spidey/telaraña/AnimatedSprite2D".hide()
	$Spidey/spidey.play("idle")
	telarana.hide()
	empate()
	


func _on_button_5_pressed():
	get_tree().change_scene_to_file("res://Escenas/combate.tscn")
