extends Node2D

var texts : Array = [
"1. Uno de los siguientes personajes fue el encargado de pintar la capilla Sixtina:\n
A) Miguel Ángel.\n B) Donatello.\n C) Leonardo Da Vinci.\n D) Francis Bacon\n","
2. Genio del renacimiento que esculpió el Moisés, el David y la Pietá:\n
A) Miguel Ángel Buonarroti.\n B) Leonardo Da Vinci.\n C) Rafael Sanzio.\nD) Galileo Galilei\n","
3. Durante el renacimiento el estilo artístico que impregnó el arte, la filosofía, la pintura escritura fue el:\n
A) El Gótico.\n B) El barroco.\n C) el clasicismo.\n D) Romanticismo\n","
4. Durante el renacimiento surge una nueva visión del hombre, que se vio reflejada en el arte, en la política y en las ciencias sociales y humanas, a lo que se denomina:\n
A) Antropocentrismo.\n B) Humanismo.\n C) Paradigma antropológico.\n D) Teocentrismo.\n","
5. Cuatro genios del renacimiento (Leonardo, Donatello, Rafael y Michelangelo) han sido llevados a la pantalla en los comics de:\n
A) Las tortugas ninjas.\n B) Los caballeros del Zodiaco.\n C) Los cuatro fantásticos. \nD) Los antagonistas de Attack Titan\n"
]

@onready var visual_text :RichTextLabel =$PanelContainer/RichTextLabel
@onready var mark : Control=$PanelContainer/Control
var current_text: int=0
var contar=0
var valor : int=0
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
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Saveus.contarpalabra>0:
		next_text()
		print("process: texto actual  ",current_text)
		set_process(false)
	pass

func next_text():
	if current_text < texts.size()-1:
		current_text +=1
		valor=current_text
		print("next text: valor ",valor)
		print("next text: texto actual  ",current_text)
		visual_text.visible_ratio=0
		visual_text.text=texts[current_text]
		mark.visible=0
		show_text()

func show_text():
	print("st: currentenshow ",current_text)
	var tween = create_tween()
	tween.tween_property(visual_text,"visible_ratio",1,1.5)
	tween.tween_callback(finish_showtext)

func finish_showtext():
	mark.visible = 1
	set_process(true)
