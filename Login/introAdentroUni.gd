extends Node2D

var texts : Array = [
"1. Seleccione el mandato cuya obligación viene del miedo al castigo o la búsqueda de un premio:\n 
A) Imperativo Hipotético. B) Imperativo categórico. C) Ambos. D) Ninguno","
2. Para Emanuel Kant, es posible conocer lo que las cosas nos permiten (como lo superficial) a través de nuestros sentidos:\n
A) Conocimiento Noumenico. B) Conocimiento fenoménico. C) conocimiento Empírico.
D) Conocimiento Racional","
3. Kant decía que el lema de la ilustración era “Sapere aude”, que significa:\n
A) Sopesa tus acciones. B) Atrévete a saber por ti mismo. C) Saber a la fuerza.
D) Someterse al conocimiento","
4. Kant (igual que Copérnico cambió el centro del universo de la tierra al sol), cambia el centro del conocimiento del objeto al sujeto, a esto se le llama:\n
A) Subjetivismo. B) Prejuicio. C) giro copernicano. D) Suerte","
5. La postura conciliadora de Kant respecto a los empiristas y racionalistas define que los datos experimentales son la fuente del conocimiento racional del sujeto:\n
A) Racionalismo. B) Empirismo. C) Criticismo. D) Escepticismo","
6. De las siguientes obras de Emanuel Kant, seleccione aquella que define su epistemología:\n
A) Critica de la razón práctica. B) Critica de la razón pura. C) Critica del juicio. D) Critica fenomenológica"
	
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
		set_process(false)
		

func next_text():
	if current_text < texts.size()-1:
		current_text +=1
		valor=current_text
		visual_text.visible_ratio=0
		visual_text.text=texts[current_text]
		mark.visible=0
		print("current ",current_text)
		if current_text==0:
			Saveus.pregunta0=true
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
		if current_text==6:
			Saveus.pregunta6=true
		
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

