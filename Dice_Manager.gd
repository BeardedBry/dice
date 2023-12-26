extends Node2D

var dice_grid = [
	Vector2(64,64), Vector2(256, 64),
	Vector2(64,256), Vector2(256, 256),
	Vector2(64,448), Vector2(256, 448)
]

var held_die = []

@onready var Roll_Button = $"../Container/RollButton"

signal roll_dice_signal

func _roll_dice():
	Roll_Button.active()
	emit_signal("roll_dice_signal")
	#print_debug('roll')

func _roll_dice_finishes(die_properties):
	print_debug("roll finished", die_properties)

func _ready():
	var DiceScene = preload("res://dice.tscn")
	Roll_Button.connect("button_up", _roll_dice)
	
	for die_vector in dice_grid:
		var die = DiceScene.instantiate()
		add_child(die)
		connect("roll_dice_signal", Callable(die, "dice_roll_action"))
		die.connect("finished_rolling_signal", _roll_dice_finishes)
		die.position = die_vector
		

