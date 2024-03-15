extends Node2D

var contar=0
var habilitar=false
var terminado=false
func _ready():
	pass # Replace with function body.
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	contarclick()

func _on_bt_a_pressed():
	hidesprites()
	$Node2D2.hide()
	
	print("primer pregunta ",Saveus.pregunta1)
	if Saveus.pregunta1:
		print("entra")
		
		Saveus.pregunta1=false
	if Saveus.pregunta2:
		print("pruebaaa")
		
		Saveus.pregunta2=false
	if Saveus.pregunta3:
		
		Saveus.pregunta3=false
	if Saveus.pregunta4:
		
		Saveus.pregunta4=false
	if Saveus.pregunta5:
		
		Saveus.pregunta5=false
		habilitar=true
	Saveus.contarpregunta=0
	$Node2D2.next_text()
	pass # Replace with function body.


func _on_bt_b_pressed():
	$Node2D2.hide()
	hidesprites()
	if Saveus.pregunta1:
		print("entra")
		
		Saveus.pregunta1=false
	if Saveus.pregunta2:
		
		Saveus.pregunta2=false
	if Saveus.pregunta3:
		
		Saveus.pregunta3=false
	if Saveus.pregunta4:
		
		Saveus.pregunta4=false
	if Saveus.pregunta5:
		
		Saveus.pregunta5=false
		habilitar=true
	$Node2D2.next_text()
	pass # Replace with function body.


func _on_bt_c_pressed():
	$Node2D2.hide()
	hidesprites()
	#$Gazelle.show()
	if Saveus.pregunta1:
		print("entra")
		#DialogueManager.show_dialogue_balloon(load("res://gazelee_wrong.dialogue"),"gazellewrong")
		Saveus.pregunta1=false
	if Saveus.pregunta2:
		#DialogueManager.show_dialogue_balloon(load("res://gazelee_wrong.dialogue"),"gazellewrong")
		Saveus.pregunta2=false
	if Saveus.pregunta3:
		#DialogueManager.show_dialogue_balloon(load("res://gazelee_wrong.dialogue"),"gazellewrong")
		Saveus.pregunta3=false
	if Saveus.pregunta4:
		#DialogueManager.show_dialogue_balloon(load("res://gazelledia.dialogue"),"gazelle")
		Saveus.pregunta4=false
	if Saveus.pregunta5:
		#DialogueManager.show_dialogue_balloon(load("res://gazelee_wrong.dialogue"),"gazellewrong")
		Saveus.pregunta5=false
		habilitar=true
	$Node2D.next_text()
	
	pass # Replace with function body.


func _on_bt_d_pressed():
	$Node2D2.hide()
	hidesprites()
	#$Mrbig.show()
	if Saveus.pregunta1:
		Saveus.pregunta1=false
	if Saveus.pregunta2:
		Saveus.pregunta2=false
	if Saveus.pregunta3:
		Saveus.pregunta3=false
	if Saveus.pregunta4:
		Saveus.pregunta4=false
	if Saveus.pregunta5:
		Saveus.pregunta5=false
		habilitar=true
	$Node2D2.next_text()
	pass 

func hidesprites():
	$btA.hide()
	$btB.hide()
	$btC.hide()
	$btD.hide()
	
func contarclick():
	Saveus.contarpregunta=0;
	

func _on_arealab_body_entered(body):
	print("entra en el laboratorio")
	DialogueManager.show_dialogue_balloon(load("res://EntraLab.dialogue"),"LLegoalUni")
	pass 
