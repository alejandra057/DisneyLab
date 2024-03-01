extends Node2D
var ruta1= ""
var ruta2= ""
var ruta3= ""
var ruta4 =""
var tiempo
func _ready():
	tiempo=$Puertas/Timerpuerta1
	if  Saveus.selecmorado==true:
		$Puertas4.frame=11
	if(Saveus.selectazul==true):
		$Puertas.frame=11
	if(Saveus.selectnara==true):
		$Puertas3.frame=11
	if(Saveus.selectrosa==true):
		$Puertas2.frame=11
	if(Saveus.habilitar==true):
		$Roulette.show()
	if(Saveus.finished_game==4):
		$transition.show()
		$transition.play("portal_")

func _process(delta):
	if Saveus.habilitar==true:
		if Input.is_action_just_pressed("space bar"): 
			$Roulette.show()
	pass
		
		
func _on_area_2d_2_body_entered(body):
	if(Saveus.selecmorado==true):
		if body.is_in_group("player"):
			$Puertas4.frame=11
			ruta1 ="res://prehistoria.tscn"
			$Label.show()
			tiempo.wait_time=1.3
			tiempo.start()


func _on_area_2d_3_body_entered(body):
	if(Saveus.selectazul==true):
		if body.is_in_group("player"):
			#$Puertas.play()
			$Puertas.frame=11
			ruta2 ="res://introduccionPoli.tscn"
			$Puertas4/Timerpuerta4.wait_time=1.3
			$Puertas4/Timerpuerta4.start()

func _on_area_2d_4_body_entered(body):
	if(Saveus.selectnara==true):
		if body.is_in_group("player"):
			#$Puertas3.play()
			$Puertas3.frame=11
			ruta3 ="res://Escenas/dr__and_perry_world.tscn"
			$Label2.show()
			$Puertas3/Timerpuerta3.wait_time=1.3
			$Puertas3/Timerpuerta3.start()


func _on_area_2d_5_body_entered(body):
	if(Saveus.selectrosa==true):
		if body.is_in_group("player"):
			$Puertas2.frame=11
			ruta4 ="res://Escenas/Rapunzel_world.tscn"
			$Puertas2/Timerpuerta2.wait_time=1.3
			$Puertas2/Timerpuerta2.start()
			


func _on_arealibro_body_entered(body):
	if body.is_in_group("player"):
		Saveus.habilitar=true
		DialogueManager.show_dialogue_balloon(load("res://introRuleta.dialogue"),"notaruleta")
			



func _on_timerpuerta_1_timeout():
	tiempo.stop()
	get_tree().change_scene_to_file(ruta1)


func _on_timerpuerta_2_timeout():
	$Puertas2/Timerpuerta2.stop()
	get_tree().change_scene_to_file(ruta4)
	pass # Replace with function body.


func _on_timerpuerta_4_timeout():
	$Puertas4/Timerpuerta4.stop()
	get_tree().change_scene_to_file(ruta2)
	pass # Replace with function body.


func _on_timerpuerta_3_timeout():
	get_tree().change_scene_to_file(ruta3)
	$Puertas3/Timerpuerta3.stop()
	pass # Replace with function body.


func _on_area_2d_body_entered(body):
	get_tree().change_scene_to_file("res://bandos.tscn")
	pass # Replace with function body.
