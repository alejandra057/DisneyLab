extends Node2D
var tiempo

# Called when the node enters the scene tree for the first time.
func _ready():
	tiempo=$AnimatedSprite2D/Timerabrir
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		print("entrar")
		#$AnimatedSprite2D.play("abrirpuerta")
		$AnimatedSprite2D.frame=7
		get_tree().change_scene_to_file("res://adentro_uni.tscn")
		#tiempo.wait_time=1.5
		#tiempo.start()
	pass # Replace with function body.


func _on_timerabrir_timeout():
	#tiempo.stop()
	#$AnimatedSprite2D.stop()
	pass # Replace with function body.
