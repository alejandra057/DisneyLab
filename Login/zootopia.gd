extends Node2D

var contar=0
var habilitar3pregunta=false
# Called when the node enters the scene tree for the first time.
func _ready():
	DialogueManager.show_dialogue_balloon(load("res://interrogatorio.dialogue"),"interrogar")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	contarclick()


func _on_bt_a_pressed():
	hidesprites()
	$Yax.show()
	if contar==1:
		DialogueManager.show_dialogue_balloon(load("res://gazelledia.dialogue"),"gazelle")
	if contar==2:
		habilitar3pregunta=true
		print("pruebaaa")
	contar=0
	pass # Replace with function body.


func _on_bt_b_pressed():
	hidesprites()
	$Oficial.show()
	if contar==1:
		DialogueManager.show_dialogue_balloon(load("res://ofidialogo.dialogue"),"oficial")
	if contar==2:
		habilitar3pregunta=true
		print("pruebaaa")
	contar=0;
	pass # Replace with function body.


func _on_bt_c_pressed():
	hidesprites()
	$Gazelle.show()
	if contar==1:
		DialogueManager.show_dialogue_balloon(load("res://yaxdialogo.dialogue"),"yax")
	if contar==2:
		habilitar3pregunta=true
		print("pruebaaa")
	contar=0;
	pass # Replace with function body.


func _on_bt_d_pressed():
	hidesprites()
	$Mrbig.show()
	if contar==1:
		DialogueManager.show_dialogue_balloon(load("res://mrbigdialogo.dialogue"),"mrbig")
	if contar==2:
		habilitar3pregunta=true
		print("pruebaaa")
	contar=0;
	pass # Replace with function body.

func hidesprites():
	$"Sospechosos-removebg-preview".hide()
	$btA.hide()
	$btB.hide()
	$btC.hide()
	$btD.hide()
	
func contarclick():
	if Input.is_action_just_pressed("space bar"):
		contar+=1
		print("contar ",contar)
		if contar==1:
			$btA.show()
			$btB.show()
			$btC.show()
			$btD.show()
			$Yax.hide()
			$Oficial.hide()
			$Gazelle.hide()
			$Mrbig.hide()
			$"Sospechosos-removebg-preview".show()
		if contar==2:
			DialogueManager.show_dialogue_balloon(load("res://1preguntapoli.dialogue"),"pregunta1")
			$btA.show()
			$btB.show()
			$btC.show()
			$btD.show()
			$Yax.hide()
			$"Sospechosos-removebg-preview".show()
		if habilitar3pregunta==true:
			$btA.show()
			$btB.show()
			$btC.show()
			$btD.show()
			$Yax.hide()
			$"Sospechosos-removebg-preview".show()
