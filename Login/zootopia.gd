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
	if  $Node2D.current_text==9:
		$Node2D.hide()
		$Label.show()
		$Label2.show()
		$Label3.show()
		$Label4.show()
		$btA.hide()
		$btB.hide()
		$btC.hide()
		$btD.hide()
		DialogueManager.show_dialogue_balloon(load("res://final_interrogatorio.dialogue"),"final_inte")
		if Input.is_action_just_pressed("a"): 
			DialogueManager.show_dialogue_balloon(load("res://wrong_answer.dialogue"),"wrongans")
		elif Input.is_action_just_pressed("b"): 
			DialogueManager.show_dialogue_balloon(load("res://wrong_answer.dialogue"),"wrongans")
		elif Input.is_action_just_pressed("c"): 
			DialogueManager.show_dialogue_balloon(load("res://wrong_answer.dialogue"),"wrongans")
		elif Input.is_action_just_pressed("d"): 
			$Button.show()
			DialogueManager.show_dialogue_balloon(load("res://right_Aswer_zoo.dialogue"),"rightansw")
			

func _on_bt_a_pressed():
	hidesprites()
	$Node2D.hide()
	$Yax.show()
	print("primer pregunta ",Saveus.pregunta1)
	if Saveus.pregunta1:
		print("entra")
		DialogueManager.show_dialogue_balloon(load("res://gazelledia.dialogue"),"gazelle")
		Saveus.pregunta1=false
	if Saveus.pregunta2:
		print("pruebaaa")
		DialogueManager.show_dialogue_balloon(load("res://yaxdialogo.dialogue"),"yax")
		Saveus.pregunta2=false
	if Saveus.pregunta3:
		DialogueManager.show_dialogue_balloon(load("res://yaxdialogo.dialogue"),"yax")
		Saveus.pregunta3=false
	if Saveus.pregunta4:
		DialogueManager.show_dialogue_balloon(load("res://yaxdialogo.dialogue"),"yax")
		Saveus.pregunta4=false
	if Saveus.pregunta5:
		DialogueManager.show_dialogue_balloon(load("res://yaxdialogo.dialogue"),"yax")
		Saveus.pregunta5=false
	Saveus.contarpregunta=0
	$Node2D.next_text()
	pass # Replace with function body.


func _on_bt_b_pressed():
	$Node2D.hide()
	hidesprites()
	$Oficial.show()
	if Saveus.pregunta1:
		print("entra")
		DialogueManager.show_dialogue_balloon(load("res://ofidialogo.dialogue"),"oficial")
		Saveus.pregunta1=false
	if Saveus.pregunta2:
		DialogueManager.show_dialogue_balloon(load("res://oficial_right.dialogue"),"right_ofi")
		Saveus.pregunta2=false
	if Saveus.pregunta3:
		DialogueManager.show_dialogue_balloon(load("res://oficial_right1.dialogue"),"right_ofi1")
		Saveus.pregunta3=false
	if Saveus.pregunta4:
		DialogueManager.show_dialogue_balloon(load("res://ofidialogo.dialogue"),"oficial")
		Saveus.pregunta4=false
	if Saveus.pregunta5:
		DialogueManager.show_dialogue_balloon(load("res://oficial_right2.dialogue"),"right_ofi2")
		Saveus.pregunta5=false
	$Node2D.next_text()
	pass # Replace with function body.


func _on_bt_c_pressed():
	$Node2D.hide()
	hidesprites()
	$Gazelle.show()
	if Saveus.pregunta1:
		print("entra")
		DialogueManager.show_dialogue_balloon(load("res://gazelee_wrong.dialogue"),"gazellewrong")
		Saveus.pregunta1=false
	if Saveus.pregunta2:
		DialogueManager.show_dialogue_balloon(load("res://gazelee_wrong.dialogue"),"gazellewrong")
		Saveus.pregunta2=false
	if Saveus.pregunta3:
		DialogueManager.show_dialogue_balloon(load("res://gazelee_wrong.dialogue"),"gazellewrong")
		Saveus.pregunta3=false
	if Saveus.pregunta4:
		DialogueManager.show_dialogue_balloon(load("res://gazelledia.dialogue"),"gazelle")
		Saveus.pregunta4=false
	if Saveus.pregunta5:
		DialogueManager.show_dialogue_balloon(load("res://gazelee_wrong.dialogue"),"gazellewrong")
		Saveus.pregunta5=false
	$Node2D.next_text()
	
	pass # Replace with function body.


func _on_bt_d_pressed():
	$Node2D.hide()
	hidesprites()
	$Mrbig.show()
	if Saveus.pregunta1:
		DialogueManager.show_dialogue_balloon(load("res://mrbigdialogo.dialogue"),"mrbig")
		Saveus.pregunta1=false
	if Saveus.pregunta2:
		DialogueManager.show_dialogue_balloon(load("res://mrbigdialogo.dialogue"),"mrbig")
		Saveus.pregunta2=false
	if Saveus.pregunta3:
		DialogueManager.show_dialogue_balloon(load("res://mrbigdialogo.dialogue"),"mrbig")
		Saveus.pregunta3=false
	if Saveus.pregunta4:
		DialogueManager.show_dialogue_balloon(load("res://mrbigdialogo.dialogue"),"mrbig")
		Saveus.pregunta4=false
	if Saveus.pregunta5:
		DialogueManager.show_dialogue_balloon(load("res://mrbigdialogo.dialogue"),"mrbig")
		Saveus.pregunta5=false
	$Node2D.next_text()
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
		if contar>1:
			
			#DialogueManager.show_dialogue_balloon(load("res://1preguntapoli.dialogue"),"pregunta1")
			$btA.show()
			$btB.show()
			$btC.show()
			$btD.show()
			$Yax.hide()
			$Oficial.hide()
			$Gazelle.hide()
			$Mrbig.hide()
			$"Sospechosos-removebg-preview".show()
			
	
	


func _on_button_pressed():
	get_tree().change_scene_to_file("res://Escenas/inicioworld.tscn")
