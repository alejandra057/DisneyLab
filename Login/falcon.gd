extends CharacterBody2D

var current_dir = "none"
const speed = 300.0
const SPEED =300.0
const JUMP_VELOCITY = -800.0
var animacion
var animacion1
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	animacion=$falcon
	animacion.play("idle")
	#animacion1 = $doctor
	#animacion1.hide()

func _physics_process(delta):
	player_movement (delta)
	## Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
#
	## Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	## Get the input direction and handle the movement/deceleration.
	## As good practice, you should replace UI actions with custom gameplay actions.
	#var direction = Input.get_axis("ui_left", "ui_right")
	#if direction:
		#velocity.x = direction * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)
#
	move_and_slide()
	#

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
	else:
		play_anim(0)
		velocity.x = 0
		velocity.y = 0
	
	move_and_slide()

func play_anim(movement):
	var dir= current_dir
	var anim = $falcon
	#var anim1 = $strange

	if dir == "right":
		anim.flip_h = false 
		if movement ==1:
			#anim1.hide()
			#anim.show()
			anim.play("derecha")
		elif  movement == 0:
			#anim.play("derecha")
			#anim.stop()
			#anim.hide()
			#anim1.show()
			anim.play("idle")
	if dir == "left":
		anim.flip_h = false
		if movement ==1:
			#anim1.hide()
			#anim.show()
			anim.play("izquierda")
		elif  movement == 0:
			#anim.play("izquierdaa")
			#anim.stop()
			#anim.hide()
			#anim1.show()
			anim.play("idle")
