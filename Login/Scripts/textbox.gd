extends CanvasLayer

const CHAR_READ_RATE = 0.05

@onready var textbox_container = $"TextBoxt Cointainer"
@onready var start_symbol = $"TextBoxt Cointainer/MarginContainer/Panel/HBoxContainer/Start"
@onready var end_symbol = $"TextBoxt Cointainer/MarginContainer/Panel/HBoxContainer/End"
@onready var label = $"TextBoxt Cointainer/MarginContainer/Panel/HBoxContainer/Label2"

enum State {
	READY,
	READING,
	FINISHED
}

var current_state = State.READY
var text_queue = []

func _ready():
	print("Starting state: State.READY")
	hide_textbox()
	queue_text("Excuse me wanderer where can I find the bathroom?")
	queue_text("Why do we not look like the others?")
	queue_text("Because we are free assets from opengameart!")
	queue_text("Thanks for watching!")

func _process(delta):
	match current_state:
		State.READY:
			if text_queue.size() > 0:
				display_text()
		State.READING:
			if Input.is_action_just_pressed("ui_accept"):
				end_symbol.text = "v"
				change_state(State.FINISHED)
		State.FINISHED:
			if text_queue.size ()== 0 && Input.is_action_just_pressed("ui_accept"):
				change_state(State.READY)
				hide_textbox()

func queue_text(next_text):
	text_queue.push_back(next_text)

func hide_textbox():
	start_symbol.text = "*"
	end_symbol.text = "v"
	label.text = ""
	textbox_container.hide()

func show_textbox():
	start_symbol.text = "*"
	textbox_container.show()

func display_text():
	var next_text = text_queue.pop_front()
	label.text = next_text

	change_state(State.READING)
	show_textbox()
	

func change_state(next_state):
	current_state = next_state
	match current_state:
		State.READY:
			print("Changing state to: State.READY")
		State.READING:
			print("Changing state to: State.READING")
		State.FINISHED:
			print("Changing state to: State.FINISHED")

func _on_Tween_tween_completed(object, key):
	end_symbol.text = "v"
	change_state(State.FINISHED)
