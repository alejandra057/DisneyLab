extends Node2D
var texts : Array = [
	"1. Para algunos de los siguientes filósofos, el criterio de verdad es la evidencia sensible: 
	A) Empiristas. B) Criticistas. C) Racionalistas. D) Dogmáticos",
	"2. De las siguientes, una de ellas es la corriente filosófica que en general tiende a negar la posibilidad de la metafísica y a sostener que hay conocimiento únicamente de los fenómenos.
	A) Racionalistas. B) Empiristas. C) Escolásticos. D) Escépticos"
	
	
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
	if Saveus.contarpregunta>0:
		next_text()
		

func next_text():
	if current_text < texts.size()-1:
		current_text +=1
		valor=current_text
		visual_text.visible_ratio=0
		visual_text.text=texts[current_text]
		mark.visible=0
		print("current ",current_text)
		if current_text==1:
			Saveus.pregunta1=true
		show_text()

func show_text():
	var tween = create_tween()
	tween.tween_property(visual_text,"visible_ratio",1,1.5)
	tween.tween_callback(finish_showtext)

func finish_showtext():
	mark.visible = 1
	animation_mark.play("MasTexto")
	set_process(true)




func _on_señal_area_entered(area):
	print("entrax2")
	pass # Replace with function body.
