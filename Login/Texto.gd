extends Node2D

var texts : Array = [
	"¿Estas listo para iniciar?",
	"Preguntas y respuestas",
	"Dirigite al camino que contiene la letra que creas que es la respuesta correcta",
	"Mucha suerte!"
	
]
var current_text: int=0

@onready var visual_text :RichTextLabel =$panel/RichTextLabel
@onready var animation_mark: AnimationPlayer=$panel/AnimationPlayer
@onready var mark : Control=$panel/Control
@onready var animation_text: AnimationPlayer =$panel/AnimationPlayer
var mostrar=false
# Called when the node enters the scene tree for the first time.	
func _ready():
	visual_text.visible_ratio=0
	visual_text.text=texts[current_text]
	mark.visible=0
	show_text()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_key_pressed(KEY_SPACE):
		next_text()
		set_process(false)
		

func next_text():
	if current_text < texts.size()-1:
		current_text +=1
		visual_text.visible_ratio=0
		visual_text.text=texts[current_text]
		mark.visible=0
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
