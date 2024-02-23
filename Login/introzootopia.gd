extends Node2D

var texts : Array = [
	"A continuacion habra una seria de preguntas, haz click en la letra del sospechoso para poder encontrar pistas.",
	"1. Durante el renacimiento, el modelo de gobierno es uno de los siguientes:
	A) Monarquía absoluta. B) Tiranía republicana. C) Democracia participativa. D) Liberalismo político.",
	"2. De los siguientes acontecimientos, selecciones el que inicia el período moderno:
	A) Toma de Constantinopla. B) Tratado de paz de westfalia. C) Toma de la Bastilla. La ruta de la seda. D) Ninguna es correcta.",
	"3. Durante el siglo XV, la sociedad se estratifica en tres estamentos definidos:
	A) Clase media, baja y alta. B) nobleza, clero y estado llano. C) Artesanos, guardianes y gobernantes. D) Ninguna es correcta.",
	"4. Aparece el realismo político, que se basaba en un orden establecido, explicación de un sistema y
	recomendaciones de como gobernar:
	A) Tomás Moro. B) Jean Bodín. C) Nicolas Maquiavelo. D) Erasmo de Rotterdam.",
	"5. Terminada la edad media, en el contexto de la política resulta que:
	A) La Iglesia resalta su poder. B) La Iglesia pierde el papel rector en la política. C) La Iglesia evangélica
	se posiciona en la política. D) La política desaparece."
	
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
