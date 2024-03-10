extends Node2D

var texts : Array = [
"4. Kant (igual que Copérnico cambió el centro del universo de la tierra al sol), cambia el centro del conocimiento del objeto al sujeto, a esto se le llama:\n
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
	if Input.is_action_just_pressed("space bar"): 
		print("reconoce")
		$btA1.show()
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




#func _on_señal_area_entered(area):
	#print("entrax2")
	#pass # Replace with function body.

func _on_bt_a_pressed():
	print(current_text)
	print("no hay respuestas correctas aqui")
	next_text()
	pass # Replace with function body.


func _on_bt_b_pressed():
	print(current_text)
	if current_text==2:
		print("repcorrecta")
	else:
		print("repincorrecta")
	next_text()
	pass # Replace with function body.


func _on_bt_c_pressed():
	print(current_text)
	if current_text==0 || current_text==1:
		print("repcorrecta")
	else:
		print("repincorrecta")
	next_text()
	pass # Replace with function body.


func _on_bt_d_pressed():
	print("no hay respuestas correctas aqui")
	next_text()
	pass # Replace with function body.
