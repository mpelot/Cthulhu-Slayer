extends HierachyMachine

@onready var player : Player = $"../.."
@onready var state_machine: StateMachine = $".."
var current_velocity: Vector2
var friction_factor: float = 300
var momentum: Vector2

func _ready():
	super()
	for child in get_children():
		if(child is Attack):
			child.attack_finishes.connect(go_back_to_control)

func enter(args = {}):
	validate_args(args)
	momentum = args["momentum"]
	current_velocity = momentum
	handle_transitioned(current_state, args["attack"])

func update(delta: float):
	if(current_velocity.length() < 0.1):
		return
	current_velocity -= current_velocity.normalized() * friction_factor * delta
	player.move_and_collide(0.6 * current_velocity * delta)
	
func validate_args(args: Dictionary):

	assert(args.has_all(["momentum", "attack"]))
	assert(args["momentum"] is Vector2)

func go_back_to_control(from: Node2D):
	current_velocity = Vector2.ZERO

	state_machine.transition_to_state("Control (BM)")

func knock_back():
	current_velocity = -momentum
	
