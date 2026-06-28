extends CanvasLayer

@export_category("Setup")
@export var main_ui : Control
@export var dialogue_ui : Control


@export_category("States")
enum UI_State{OVERWORLD, DIALOGUE}
@export var ui_state : UI_State = UI_State.OVERWORLD

# Called when the node enters the scene tree for the first time.
func _ready():
	_set_ui_state(UI_State.OVERWORLD)

func _process(delta):
	pass

func _set_ui_state(next_state:int):	
	var prev_ui_state := ui_state
	ui_state = next_state
		
	#check last state
	match(prev_ui_state):
		UI_State.OVERWORLD:
			main_ui.visible = false
		UI_State.DIALOGUE:
			dialogue_ui.visible = false
	#setup next state
	match(next_state):
		UI_State.OVERWORLD:
			main_ui.visible = true
		UI_State.DIALOGUE:
			dialogue_ui.visible = true
