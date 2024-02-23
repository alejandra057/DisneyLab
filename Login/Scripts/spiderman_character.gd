extends CharacterBody2D
const speed= 400
var current_dir = "none"
var vida1
var vida2
var vida3
var vida4
var vida5

func _ready():
	$AnimatedSprite2D.play("front_idle")
	vida1=$"1vida"
	vida2=$"2vidas"
	vida3=$"3vidas"
	vida4=$"4vidas"
	vida5=$"5vidas"
	vida5.hide()
	vida4.hide()
	vida3.hide()
	vida2.hide()
	vida1.hide()
func _process(delta):
	if Saveus.right_answer1==true:
		vida1.show()
		Saveus.right_answer1=false
	elif Saveus.right_answer2==true:
		$"2vidas".show()
		Saveus.right_answer2=false
	elif Saveus.right_answer3==true:
		vida3.show()
		Saveus.right_answer3=false
	elif Saveus.right_answer4==true:
		vida4.show()
		Saveus.right_answer4=false
	elif Saveus.right_answer5==true:
		vida5.show()
		

func _physics_process(delta):
	player_movement(delta)
	
func player_movement (delta):
	if Saveus.win_spidey==true:
		$AnimatedSprite2D.play("kick_idle")
		await get_tree().create_timer(1).timeout
		Saveus.win_spidey=false
	if Saveus.caida == true:
		$AnimatedSprite2D.play("fall_idle")
		await get_tree().create_timer(1).timeout
		Saveus.caida = false
	else:
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
		
