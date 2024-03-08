extends CharacterBody2D

const speed= 400
var current_dir = "none"

func _ready():
	$AnimatedSprite2D.play("front_idle")

func _physics_process(delta):
	player_movement(delta)
	
func player_movement (delta):
	
	if Input.is_action_pressed("ui_right"):
		current_dir= "right"
		play_anim(1)
		velocity.x = speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_left"):
		current_dir= "left"
		play_anim(1)
		velocity.x =-speed
		velocity.y = 0
	elif  Input.is_action_pressed("ui_down"):
		current_dir= "down"
		play_anim(1)
		velocity.y= speed
		velocity.x= 0
	elif  Input.is_action_pressed("ui_up"):
		current_dir= "up"
		play_anim(1)
		velocity.y = -speed
		velocity.x = 0
	else:
		play_anim(0)
		velocity.x = 0
		velocity.y = 0
	move_and_slide()
	
func play_anim(movement):
	var dir= current_dir
	var anim = $AnimatedSprite2D

	if dir == "right":
		anim.flip_h = false 
		if movement ==1:
			anim.play("right_idle")
		elif  movement == 0:
			anim.play("front_idle")
	if dir == "left":
		anim.flip_h = false
		if movement ==1:
			anim.play("left_idle")
		elif  movement == 0:
			anim.play("front_idle")
	if dir == "down":
		anim.flip_h = false 
		if movement ==1:
			anim.play("front_idle")
		elif  movement == 0:
			anim.play("front_idle")
	if dir == "up":
		anim.flip_h = false
		if movement ==1:
			anim.play("back_idle")
		elif  movement == 0:
			anim.play("front_idle")
		
		

func _process(delta):
	if $Node2D.valor==4 || $Node2D.valor==8 || $Node2D.valor==12:
		$Node2D.hide()
		
func _on_area_2d_body_entered(body):
	$Node2D.show()
	pass # Replace with function body.


func _on_areamesa_1_body_entered(body):
	$Node2D.show()
	
	pass # Replace with function body.


func _on_areamesa_2_body_entered(body):
	if $Node2D.valor==4:
		$Node2D.next_text()
	$Node2D.show()
	
	pass # Replace with function body.


func _on_areamesa_3_body_entered(body):
	if $Node2D.valor==8:
		$Node2D.next_text()
	$Node2D.show()
	pass # Replace with function body.


func _on_areamesa_4_body_entered(body):
	if $Node2D.valor==12:
		$Node2D.next_text()
	$Node2D.show()
	pass # Replace with function body.


func _on_areamesa_1_body_exited(body):
	$Node2D.hide()
	pass # Replace with function body.


func _on_areamesa_2_body_exited(body):
	$Node2D.hide()
	pass # Replace with function body.


func _on_areamesa_3_body_exited(body):
	$Node2D.hide()
	pass # Replace with function body.


func _on_areamesa_4_body_exited(body):
	$Node2D.hide()
	pass # Replace with function body.
