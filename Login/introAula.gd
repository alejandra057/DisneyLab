extends Node2D

var texts : Array = [
	"Mesa de la Evidencia:
	Bienvenido al aula de la fundamentación de la teoria querido Peter.",
	"En este espacio responderas una serie de preguntas que te daran pistas para resolver un caso, 
	pero primero debes hablar con Emanuel Kant para que te guie en esta aventura","¡Suerte Peter!"
	
]
var current_text: int=0
var contar=0
var valor : int=0

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
	if Input.is_action_just_pressed("space bar"): 
		next_text()
	

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
	animation_mark.play("MasTexto")
	set_process(true)




#func _on_señal_area_entered(area):
	#print("entrax2")
	#pass # Replace with function body.
#
#
#func _on_respa_pressed():
#
	#if current_text==15 || current_text==14:
		#print("repcorrecta")
	#else:
		#print("repincorrecta")
	#next_text()
	#pass # Replace with function body.
#
#
#func _on_respb_pressed():
	#if current_text==10 :
		#print("repcorrecta")
	#else:
		#print("repincorrecta")
	#next_text()
	#pass # Replace with function body.
#
#
#func _on_respc_pressed():
	#if current_text==6:
		#print("repcorrecta")
	#else:
		#print("repincorrecta")
	#next_text()
	#pass # Replace with function body.
#
#
#func _on_respd_pressed():
	#if current_text==2:
		#print("repcorrecta")
	#else:
		#print("repincorrecta")
	#next_text()
	pass # Replace with function body.
