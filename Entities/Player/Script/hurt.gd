extends State

func enter(args = {}):
	assert(validate_args(args), "Not enough args when transitioning to the hurt state, expecting 'damage'")
	handle_damage(args["damage"])
	
func handle_damage(damage: float):
	GameManager.health -= damage


func validate_args(args: Dictionary):
	return args.has_all(["damage"])

func update(delta):
	pass
