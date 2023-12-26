extends Button

var button_state = { 
	"ready": "ready", 
	"active": "active"
}
var current_state = button_state.ready

func _process(_delta):
	pass

func active():
	if current_state == button_state.ready:
		current_state = button_state.active
		disabled = true
		text = "Rolling.."

func ready(new_text := "Roll"):
	current_state = button_state.ready
	disabled = false
	text = new_text
