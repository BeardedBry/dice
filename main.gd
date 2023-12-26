extends Node2D

var dice_total = 0;
var dice_count = 0;

@onready var dice_total_label = get_node("Container/DiceLabel")


func _on_button_dice_roll_button_signal(value):
	print_debug("dice rolled")
	dice_total = 0
	dice_total_label.text = ""
	dice_count = 0


func _on_dice_value(value):
	dice_count += 1
	dice_total += value
	if dice_count == 6:
		dice_total_label.text = var_to_str(dice_total)
	#print_debug(value)
	
