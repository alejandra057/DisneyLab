extends CharacterBody2D

func _physics_process(delta):
	player_movement(delta)
	
func player_movement (delta):
	if Saveus.mysterio==true:
		$AnimatedSprite2D.play("falls_idle")
		await get_tree().create_timer(1).timeout
		Saveus.mysterio=false
		
