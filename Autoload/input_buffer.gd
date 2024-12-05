extends Node
# Keeps track of recent inputs in order to make timing windows more flexible.
# Intended use: Add this file to your project as an Autoload script and have other objects call the class' methods.
# (more on AutoLoad: https://docs.godotengine.org/en/stable/tutorials/scripting/singletons_autoload.html)

# How many milliseconds ahead of time the player can make an input and have it still be recognized.
# I chose the value 150 because it imitates the 9-frame buffer window in the Super Smash Bros. Ultimate game.
const BUFFER_WINDOW: int = 500
# The godot default deadzone is 0.2 so I chose to have it the same
const JOY_DEADZONE: float = 0.2

var keyboard_timestamps: Dictionary
var joypad_timestamps: Dictionary
const REGISTERED_ACTIONS: Array[StringName] = [
	&"Dash", &"Melee"
	
]


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	process_mode = Node.PROCESS_MODE_PAUSABLE

	# Initialize all dictionary entris.
	keyboard_timestamps = {}
	joypad_timestamps = {}
	

# Called whenever the player makes an input.
func _input(event: InputEvent) -> void:
	for action in REGISTERED_ACTIONS:
		if(Input.is_action_just_pressed(action)):
			keyboard_timestamps[action] = Time.get_ticks_msec()
	print(keyboard_timestamps)
	

# Returns whether any of the keyboard keys or joypad buttons in the given action were pressed within the buffer window.
func is_action_press_buffered(action: String) -> bool:
	if(keyboard_timestamps.has(action)):
		if(Time.get_ticks_msec() - keyboard_timestamps[action] < BUFFER_WINDOW):
			_invalidate_action(action)
			return true
	return false
	
func is_window_press_buffered(action: String, window: float) -> bool:
	if(keyboard_timestamps.has(action)):
		if(Time.get_ticks_msec() - keyboard_timestamps[action] < window):
			_invalidate_action(action)
			return true
	return false


# Records unreasonable timestamps for all the inputs in an action. Called when IsActionPressBuffered returns true, as
# otherwise it would continue returning true every frame for the rest of the buffer window.
func _invalidate_action(action: String) -> void:
	keyboard_timestamps[action] = -1
	
