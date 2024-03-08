extends Node2D

var texts : Array = [
	"Mesa de la Evidencia:
	Bienvenido al laboratorio de la duda de Descartes. En esta mesa, se te presentarán distintos dilemas que deberás resolver utilizando el método cartesiano.",
	"Encuentra un libro con una página en blanco, un pergamino con una escritura ilegible y una hoja en blanco. 
	Debe determinar cuál de los elementos contiene información confiable y qué información debe ser dudada. (Haz clic en el objeto)",
	"Son los pasos o razones de la duda metódica: 
	A) Los sentidos nos engañan, B) la existencia del genio maligno, C) imposibilidad para diferenciar la vigilia del sueño. D) Todas son correctas",
	"Una de las siguientes es considerada de las cuatro reglas del método en Descartes:
	A) Hipótesis. B) Deducción. C) Evidencia. D) Inducción.",
	"En relación con los datos experimentales que otorgan los sentidos en el conocimiento, Descartes define como: 
	A) Los sentidos son una fuente confiable para conocer. B) Desconfianza de lo que los sentidos nos proporcionan. C) Los sentidos son complementarios. D) Los sentidos son determinantes",
	"Solo debemos aceptar como verdadero aquel conocimiento que sea EVIDENTE, CLARO Y DISTINTO: 
	A) René Descartes. B) David Hume. C) George Berkeley. D) Aristóteles",
	"En cuanto a la certeza del conocimiento, René Descartes afirma lo siguiente: 
	A) Es preciso dudar. B) Debemos confiar ciegamente. C) Nada es importante. D) Todo es posible"
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
	if Input.is_action_just_pressed("space bar"): 
		print("reconoce")
		if current_text==0 || current_text==1 :
			next_text()
		else:
			$RESPA.show()
			$RESPB.show()
			$RESPC.show()
			$RESPD.show()

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




func _on_señal_area_entered(area):
	print("entrax2")
	pass # Replace with function body.


func _on_respa_pressed():
	if current_text==3 || current_text==4 || current_text==2:
		print("repincorrecta")
	if current_text==5 || current_text==6:
		print("repcorrecta")
	next_text()
	pass # Replace with function body.


func _on_respb_pressed():
	if current_text==2 || current_text==3 || current_text==5 || current_text==6:
		print("repincorrecta")
	if current_text==4 :
		print("repcorrecta")
	next_text()
	pass # Replace with function body.


func _on_respc_pressed():
	if current_text==3:
		print("repcorrecta")
	else:
		print("repincorrecta")
	next_text()
	pass # Replace with function body.


func _on_respd_pressed():
	if current_text==2:
		print("repcorrecta")
	else:
		print("repincorrecta")
	next_text()
	pass # Replace with function body.
