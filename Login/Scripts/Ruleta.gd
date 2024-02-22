extends Node2D

var velocidad=20
var encendido=false
var contar=0
var estado
var opciones=[]
var lbpolitica : Label
var lbciencia : Label
var lbarte: Label
var lbhistoria : Label
var texto : Label
var selecmorado=false
var selectnara=false
var selectazul=false
var selectrosa=false
var tiempoextra=0
@onready var timer=$"../Timer"
@onready var rotacion=$"."

# Called when the node enters the scene tree for the first time.
func _ready():
	encendido=false
	print("opciones: ",opciones)
	lbpolitica=$lbpolitica
	lbciencia=$lbciencia
	lbarte=$lbarte
	lbhistoria=$lbhistoria
	texto =$"../lbanuncio"
	#lbarte.show()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if velocidad<=0:
		encendido=false
		timer.stop()
		eliminar()
		if tiempoextra>0:
			
			timer.start(tiempoextra)
			print("tiempo: ",tiempoextra)
			tiempoextra=0
	if encendido==true:
		rotacion.rotation_degrees+=velocidad
	else:
		encendido=false
	pass


func _on_timer_timeout():
	velocidad-=5



func _input(event):
	if Input.is_action_just_pressed("space bar"):
		contar=1
		velocidad=randf_range(15,25)
		encendido=true
		#randomize()
		timer.start()


func _on_area_2d_area_entered(area):
	if area.is_in_group("Color"):
		estado="Naranja"
		print(estado)
		if selectnara==true:
			tiempoextra+3
			print("pasa")
			if Input.is_action_just_pressed("e"):
				$AnimationPlayer.play()
	pass # Replace with function body.


func _on_area_2d_2_area_entered(area):
	if area.is_in_group("Color"):
		estado="Rosa"
		print(estado)
		if selectrosa==true:
			tiempoextra+3
			print("pasa")
	
	pass # Replace with function body.


func _on_area_2d_3_area_entered(area):
	if area.is_in_group("Color"):
		estado="Azul"
		print(estado)
		if selectazul==true:
			tiempoextra+3
			print("pasa")
	pass # Replace with function body.


func _on_area_2d_4_area_entered(area):
	if area.is_in_group("Color"):
		estado="Morado"
		print(estado)
		if selecmorado==true:
			tiempoextra+3
			print("pasa")
	pass # Replace with function body.

func eliminar():
			if "Morado"==estado:
				lbhistoria.show()
				texto.text="CATEGORIA\nHISTORIA"
				selecmorado=true
			elif "Azul"==estado:
				lbpolitica.show()
				texto.text="CATEGORIA\nPOLITICA"
				selectazul=true
			elif "Naranja"==estado:
				lbciencia.show()
				texto.text="CATEGORIA\nCIENCIA"
				selectnara=true
			elif "Rosa"==estado:
				lbarte.show()
				texto.text="CATEGORIA\nARTE"
				selectrosa=true



func _on_button_pressed():
	get_tree().change_scene_to_file("res://ejemplo.tscn")
	pass # Replace with function body.


func _on_button_2_pressed():
	get_tree().change_scene_to_file("res://ejemplo.tscn")
	pass 
