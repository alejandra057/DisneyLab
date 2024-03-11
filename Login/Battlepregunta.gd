extends Node2D
var texts : Array = [
	"3. Para unos de los siguientes filósofos, la experiencia como única fuente del conocimiento.
	A) Epistemólogos. B) Racionalistas. C) Empiristas. D) Escépticos",
	"4. Filósofos para quienes la única fuente del conocimiento es la razón. 
	A) Epistemólogos. B) Racionalistas. C) Empiristas. D) Escépticos",
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
		if current_text==2:
			Saveus.pregunta2=true
		if current_text==3:
			Saveus.pregunta3=true
		if current_text==4:
			Saveus.pregunta4=true
		if current_text==5:
			Saveus.pregunta5=true
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
