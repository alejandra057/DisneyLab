extends Node2D

var contar=0
var habilitar3pregunta=false
# Called when the node enters the scene tree for the first time.
func _ready():
	#DialogueManager.show_dialogue_balloon(load("res://interrogatorio.dialogue"),"interrogar")
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	contarclick()


func _on_bt_a_pressed():
	hidesprites()
	
	$Node2D.hide()
	$Yax.show()
	print("primer pregunta ",Saveus.pregunta1)
	if Saveus.pregunta1:
		$Node2D.next_text()
		Saveus.contarpregunta+=1
		print("entra")
		DialogueManager.show_dialogue_balloon(load("res://gazelledia.dialogue"),"gazelle")
		Saveus.pregunta1=false
	if Saveus.pregunta2:
		$Node2D.next_text()
		Saveus.contarpregunta+=1
		habilitar3pregunta=true
		print("pruebaaa")
		Saveus.pregunta2=false
	Saveus.contarpregunta+=0
	pass # Replace with function body.


func _on_bt_b_pressed():
	hidesprites()
	Saveus.contarpregunta+=1
	$Oficial.show()
	if Saveus.pregunta1:
		$Node2D.next_text()
		print("entra")
		DialogueManager.show_dialogue_balloon(load("res://ofidialogo.dialogue"),"oficial")
		Saveus.pregunta1=false
	if Saveus.pregunta2:
		$Node2D.next_text()
		habilitar3pregunta=true
		print("pruebaaa")
		Saveus.pregunta2=false
	contar=0;
	pass # Replace with function body.


func _on_bt_c_pressed():
	hidesprites()
	Saveus.contarpregunta+=1
	$Gazelle.show()
	if Saveus.pregunta1:
		$Node2D.next_text()
		print("entra")
		DialogueManager.show_dialogue_balloon(load("res://yaxdialogo.dialogue"),"yax")
		Saveus.pregunta1=false
	if Saveus.pregunta2:
		$Node2D.next_text()
		habilitar3pregunta=true
		Saveus.pregunta2=false
	contar=0;
	pass # Replace with function body.


func _on_bt_d_pressed():
	hidesprites()
	Saveus.contarpregunta+=1
	$Mrbig.show()
	if Saveus.pregunta1:
		$Node2D.next_text()
		DialogueManager.show_dialogue_balloon(load("res://mrbigdialogo.dialogue"),"mrbig")
		Saveus.pregunta1=false
	if Saveus.pregunta2:
		$Node2D.next_text()
		habilitar3pregunta=true
		Saveus.pregunta2=false
	contar=0;
	pass # Replace with function body.

func hidesprites():
	$"Sospechosos-removebg-preview".hide()
	$btA.hide()
	$btB.hide()
	$btC.hide()
	$btD.hide()
	
func contarclick():
	Saveus.contarpregunta=0;
	
	if Input.is_action_just_pressed("space bar"):
		$Node2D.show()
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
			Saveus.contarpregunta=1;
		if contar==2:
			
			#DialogueManager.show_dialogue_balloon(load("res://1preguntapoli.dialogue"),"pregunta1")
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
	
	
