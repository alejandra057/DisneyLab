extends Node2D

var texts : Array = [
	" Entre los siguientes renacentistas seleccione, uno de los precursores filósofo-científico del heliocentrismo 
	  (teoría que afirma que el sol es el centro del universo)
	  A) Tomas Moro. B) Galileo. C) Platón. D) Arquimedes ",
	 "El método científico se introduce por el interés de tres filósofos. Entre los siguientes
	 uno de los mencionados no es precursor del método científico: A) Francis Bacon. B) Galileo Galilei. C)Nicolas Maquiavelo. D) René Descartes",
	" Es uno de los precursores   del pensamiento Moderno:  
	A) Isaac Newton. B) René Descartes. C) Erasmo de Roterdam. D) Francis Bacon",
	" De los siguientes filósofos niega el geocentrismo (teoría que afirma que el centro de nuestro sistema solar 
	  es la tierra):  
	  A) Aristóteles. B) Nicolás Copérnico. C) Tomás de Aquino.  D) Isaac Newton",
	"Uno de los inventos que suscitó un conocimiento ilimitado, fue el de Gutenberg:  
	A) El astrolabio. B) La imprenta. C) La Nao y la Carabela. D) El Telescopio"
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
	if Saveus.contarpalabra>0:
		next_text()
		print("currentxx2 ",current_text)
		set_process(false)
		

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


func _on_areac_body_entered(body):
	if valor!=1:
		print("Respuesta incorrecta")
	else:
		valor+=1
		print("Respuesta correcta")



func _on_area_a_body_entered(body):
	print("Respuesta incorrecta")
	current_text-=1
	pass # Replace with function body.


func _on_area_d_body_entered(body):
	print("Respuesta incorrecta")
	current_text-=1
	pass # Replace with function body.

func _on_areab_body_entered(body):
	print("current ",valor)
	if valor!=1:
		valor+=1
		print("Respuesta correcta")
	else:
		print("Respuesta incorrecta")
		
	
		#_process(body)
	pass # Replace with function body.
