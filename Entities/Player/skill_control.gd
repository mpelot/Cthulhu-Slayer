extends Behavior


@onready var state_machine : StateMachine = $"../.."
@onready var movement: MovementBehavior = $"../Movement"

func update(delta: float):
	var args : Dictionary = {}
	args["momentum"] = movement.momentum
	args["direction"] = movement.last_move_direction
	if(InputBuffer.is_action_press_buffered("Melee")):
		args["attack"] = "melee" 
		state_machine.transition_to_state("Attacking", args)
	if(InputBuffer.is_action_press_buffered("Dash")):
		state_machine.transition_to_state("Dashing", args)
