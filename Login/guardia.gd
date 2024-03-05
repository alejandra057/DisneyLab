extends CharacterBody2D

const speed = 30
var current_state = IDLE

var dir = Vector2.RIGHT

var start_pos
var is_roaming = true
var is_chatting = false
var chat= false
var player
var player_in_chat_zone = false

enum {
	IDLE,
	NEW_DIR,
	MOVE,
}

func _ready():
	randomize()
	start_pos = position
	current_state = IDLE
	print(current_state)
	
	
func _process(delta):
	if current_state == IDLE or current_state == NEW_DIR:
		$AnimatedSprite2D.play("idle")
	elif current_state == MOVE and !is_chatting:
		if dir.x == -1:
			$AnimatedSprite2D.play("left")
		elif dir.x == 1:
			$AnimatedSprite2D.play("Right")
		elif dir.y == -1:
			$AnimatedSprite2D.play("Up")
		elif dir.y == 1:
			$AnimatedSprite2D.play("Down")

	if is_roaming:
		match current_state:
			IDLE:
				pass
			NEW_DIR:
				dir = choose([Vector2.RIGHT, Vector2.LEFT,Vector2.DOWN,Vector2.UP])
			MOVE:
				move(delta)
				move_and_slide()

	if Input.is_action_just_pressed("ui_accept"):
		
		if chat == true:
			print("chatting")
			DialogueManager.show_dialogue_balloon(load("res://guardia.dialogue"),"hola")

		print(current_state)

	move_and_slide()

func choose(array):
	array.shuffle()
	return array.front()

func move(delta):
	if !is_chatting:
		position += dir * speed * delta

func _physics_process(delta):
	pass


func _on_timer_timeout():
	$Timer.wait_time  = choose([0.5, 1, 1, 1])
	current_state = choose([IDLE, NEW_DIR, MOVE])




func _on_area_2d_area_exited(area):
	if area.is_in_group("player"):
		chat=false
		$Timer.start()



func _on_area_2d_area_entered(area):
	if area.is_in_group("player"):
		chat=true
		$Timer.stop()



func _on_guardia_body_entered(body):
	if body.is_in_group("player"):
		chat=true
		
