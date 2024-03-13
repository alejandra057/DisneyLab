extends Node2D

var texts : Array = [
"Seleccione el mandato cuya obligación viene del miedo al castigo o la búsqueda de un premio:\n 
A) Imperativo Hipotético. B) Imperativo categórico. C) Ambos. D) Ninguno","
Para Emanuel Kant, es posible conocer lo que las cosas nos permiten (como lo superficial) a través de nuestros sentidos:\n
A) Conocimiento Noumenico. B) Conocimiento fenoménico. C) conocimiento Empírico.
D) Conocimiento Racional","
Kant decía que el lema de la ilustración era “Sapere aude”, que significa:\n
A) Sopesa tus acciones. B) Atrévete a saber por ti mismo. C) Saber a la fuerza.
D) Someterse al conocimiento","...",""
	
]
var current_text: int=0
var contar=0
var valor : int=0
var terminado = false

@onready var visual_text :RichTextLabel =$panel/RichTextLabel
@onready var animation_mark: AnimationPlayer=$panel/AnimationPlayer
@onready var mark : Control=$panel/Control
@onready var animation_text: AnimationPlayer =$panel/AnimationPlayer
var mostrar=false
var electC=false
var electA=false
var electB=false
var electD=false
# Called when the node enters the scene tree for the first time.	
func _ready():
	visual_text.visible_ratio=0
	visual_text.text=texts[current_text]
	mark.visible=0
	show_text()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#if Input.is_action_just_pressed("space bar"): 
		#print("reconoce")
		#if current_text==0 || current_text==1 || current_text==3 || current_text==5 || current_text==7 || current_text==9 || current_text==11 || current_text==13:
			#$btA.hide()
			#$RESPB.hide()
			#$RESPC.hide()
			#$RESPD.hide()
			#next_text()
		#else:
		$btA.show()
		$btB.show()
		$btC.show()
		$btD.show()
		

func next_text():
	if current_text < texts.size()-1:
		current_text +=1
		valor=current_text
		visual_text.visible_ratio=0
		visual_text.text=texts[current_text]
		mark.visible=0
		print("current ",current_text)
		show_text()

func show_text():
	var tween = create_tween()
	tween.tween_property(visual_text,"visible_ratio",1,1.5)
	tween.tween_callback(finish_showtext)

func finish_showtext():
	mark.visible = 1
	#animation_mark.play("MasTexto")
	set_process(true)




func _on_señal_area_entered(area):
	print("entrax2")
	pass # Replace with function body.

func _on_bt_a_pressed():
	if current_text==0:
		print("repcorrecta")
	else:
		print("repincorrecta")
	next_text()
	pass # Replace with function body.


func _on_bt_b_pressed():
	if current_text==1 || current_text==2 :
		print("repcorrecta")
	else:
		print("repincorrecta")
	next_text()
	proximo_libro()
	pass # Replace with function body.

func proximo_libro():
	if current_text==4:
		$btA.hide()
		$btB.hide()
		$btC.hide()
		$btD.hide()
		$".".hide()
		#terminado=true
	pass

func _on_bt_c_pressed():
	print("no hay respuestas correctas aqui")
	next_text()
	pass # Replace with function body.


func _on_bt_d_pressed():
	print("no hay respuestas correctas aqui")
	next_text()
	pass # Replace with function body.
