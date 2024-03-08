extends CanvasLayer
@onready var health_bar : ProgressBar=$VBoxContainer/health
@onready var health_text : RichTextLabel=$VBoxContainer/health/RichTextLabel
# Called when the node enters the scene tree for the first time.
var some_health_amount =150
var current_value:int
var max_value: int
func _process(delta):
	pass
func _ready() -> void:
	_update_health_bar(1000,1000)
func _update_health_bar(current_hp:int,max_hp:int)->void:
	current_value= current_hp
	max_value = max_hp
	health_bar.max_value=max_hp
	health_bar.value=current_hp
	health_text.clear()
	health_text.append_text("[center][b]%s/%s"% [current_hp,max_hp])
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _update_health_bar_color(current_hp:int,max_hp:int)->void:
	if(current_hp > max_hp * 0.6):
		health_bar.set_theme_type_variation("HealthBar")
	elif(current_hp > max_hp * 0.3):
		health_bar.set_theme_type_variation("HealthBarMid")
	else:
		health_bar.set_theme_type_variation("HelathBarLow")
func add_health()->void:
	current_value +=some_health_amount
	if(current_value > max_value):
		current_value=max_value
	_update_health_bar(current_value,max_value)
func reduce_health()->void:
	current_value -=some_health_amount
	if(current_value <0):
		current_value=0
	_update_health_bar(current_value,max_value)
