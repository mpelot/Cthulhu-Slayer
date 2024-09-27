#Calling one of its state at a time
extends Node2D
class_name StateMachine

@export var initial_state: State
var current_state: State
var states: Dictionary

func _ready():
	var children := get_children()
	for child in children:
		if(child is State):
			states[child.name.to_lower()] = child
			child.transitioned.connect(handle_transitioned)
			if(child == initial_state):
				current_state = child
				current_state.enter()
	on_ready()
	
func on_ready():
	pass

	
func _process(delta):
	if(current_state != null):
		current_state.update(delta)
	
	
func _physics_process(delta):
	if(current_state != null):
		current_state.physic_update(delta)
	
	
func handle_transitioned(state: State, new_state_name: String, args: Dictionary = {}):
	if(state != current_state):
		return
	
	var new_state = states[new_state_name.to_lower()]
	current_state.exit()
	current_state = new_state
	var next_args = args.duplicate()
	next_args["previous_state"] = state.name.to_lower()
	current_state.enter(next_args)
	
	
