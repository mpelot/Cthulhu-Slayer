#Hierachy Machine is a combination of state machine and a state at the same time
#The concept is that a hierachy machine can act as a state if it is under
#a state_machine or hierachy machine and act as state_machine for all of its state
#This create a tree like of state machine allow for more complicated behaviors

extends State
class_name HierachyMachine

var is_under_state_machine: bool = false
var states : Dictionary
var current_state : State
@export var initial_state : State


func _ready():
	
	
	for child in get_children():
		if(child is State):
			states[child.name.to_lower()] = child
			child.transitioned.connect(handle_transitioned)
			if(child == initial_state):
				current_state = child
	
	var parent = get_parent()
	if(parent is StateMachine or parent is HierachyMachine):
		is_under_state_machine = true


func enter(args = {}):
	current_state = initial_state
	if(current_state != null):
		current_state.enter(args)

func _process(delta):
	if(not is_under_state_machine):
		update(delta)

func _physics_process(delta):
	if(not is_under_state_machine):
		physic_update(delta)


func update(delta):
	if(current_state != null):
		current_state.update(delta)

func physic_update(delta):
	if(current_state != null):
		current_state.physic_update(delta)

func exit():
	if(current_state != null):
		current_state.exit()

func handle_transitioned(state: State, new_state_name: String, args: Dictionary = {}):
	if(state != current_state):
		return
	
	var new_state = states[new_state_name.to_lower()]
	current_state.exit()
	current_state = new_state
	var next_args = args.duplicate()
	next_args["previous_state"] = state.name.to_lower()
	current_state.enter(next_args)
