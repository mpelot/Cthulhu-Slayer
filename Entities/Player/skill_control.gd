extends Behavior


@onready var state_machine : StateMachine = $"../.."
@onready var movement: MovementBehavior = $"../Movement"

func update(delta: float):
	var args : Dictionary = {}
	args["momentum"] = movement.momentum
	args["direction"] = movement.last_move_direction
	if(Input.is_action_just_pressed("Melee")):
		args["attack"] = "melee" 
		state_machine.transition_to_state("Attacking", args)
	if(Input.is_action_just_pressed("Shoot")):
		args["attack"] = "ranged"
		state_machine.transition_to_state("Attacking", args)
	if(Input.is_action_just_pressed("Dash")):
		state_machine.transition_to_state("Dashing", args)
