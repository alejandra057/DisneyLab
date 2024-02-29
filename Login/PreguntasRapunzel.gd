extends Node2D

var texts : Array = [
	"1. Uno de los siguientes personajes fue el encargado de pintar la capilla Sixtina:
A) Miguel Ángel. B) Donatello. C) Leonardo Da Vinci. D) Francis Bacon","
2. Genio del renacimiento que esculpió el Moisés, el David y la Pietá:
A) Miguel Ángel Buonarroti. B) Leonardo Da Vinci. C) Rafael Sanzio. D) Galileo Galilei","
3. Durante el renacimiento el estilo artístico que impregnó el arte, la filosofía, la pintura escritura fue el:
5. Cuatro genios del renacimiento (Leonardo, Donatello, Rafael y Michelangelo) han sido llevados a la pantalla en los comics de:
A) Las tortugas ninjas. B) Los caballeros del Zodiaco. C) Los cuatro fantásticos. D) Los antagonistas de Attack Titan"
]
var current_text: int=0
var contar=0
var valor : int=0
@onready var visual_text :RichTextLabel =$Panel/RichTextLabel
@onready var animation_mark: AnimationPlayer=$Panel/AnimationPlayer
@onready var mark : Control=$Panel/Control
@onready var animation_text: AnimationPlayer =$Panel/AnimationPlayer
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
		print("currentxx2 ",current_text)
		set_process(false)
	pass

func next_text():
	if current_text < texts.size()-1:
		current_text +=1
		valor=current_text
		print("valor",valor)
		print("currentxx ",current_text)
		visual_text.visible_ratio=0
		visual_text.text=texts[current_text]
		mark.visible=0
		show_text()

func show_text():
	print("currentenshow ",current_text)
	var tween = create_tween()
	tween.tween_property(visual_text,"visible_ratio",1,1.5)
	tween.tween_callback(finish_showtext)

func finish_showtext():
	mark.visible = 1
	animation_mark.play("MasTexto")
	set_process(true)

func _on_area_b_body_entered(body):
	print("current ",valor)
	if valor!=1:
		valor+=1
		print("Respuesta correcta")
	else:
		print("Respuesta incorrecta")
	pass # Replace with function body.


func _on_area_d_body_entered(body):
	print("Respuesta incorrecta")
	current_text-=1
	pass # Replace with function body.


func _on_area_a_body_entered(body):
	print("Respuesta incorrecta")
	current_text-=1
	pass # Replace with function body.


func _on_area_c_body_entered(body):
	if valor!=1:
		print("Respuesta incorrecta")
	else:
		valor+=1
		print("Respuesta correcta")
	pass # Replace with function body.
