extends State

@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"

func enter(args = {}):
	assert(validate_args(args), "Not enough args when transitioning to the hurt state, expecting 'damage'")
	handle_damage(args["damage"])
	
func handle_damage(damage: float):
	GameManager.health -= damage
	animation_player.play("Hurt")

func handle_animation_finishes(anim_name):
	if(anim_name != "Hurt"):
		return
	transitioned.emit(self, "control (bm)")

func validate_args(args: Dictionary):
	return args.has_all(["damage"])

func update(delta):
	pass
