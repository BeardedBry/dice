extends Node2D

@onready var dice_sprite = $AnimatedSprite2D
@onready var dice_roll_timer = $RollTimer
var roll_button
var main
#var dice_value

signal finished_rolling_signal

var dice_properties = {}

# Called when the node enters the scene tree for the first time.
func _ready():
	dice_sprite.frame = randf_range(0,5)

func dice_roll_action():
	dice_sprite.play("default")
	dice_roll_timer.start(randf_range(1, 2))

func _on_timer_timeout():
	dice_sprite.stop()
	var _value = randi_range(0, 6)
	dice_sprite.frame = _value
	dice_properties.value = _value
	emit_signal("finished_rolling_signal", dice_properties)
