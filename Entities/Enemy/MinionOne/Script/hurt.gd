extends EnemyState


@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"

func enter(args = {}):
	assert(validate_args(args), "No damage found whe enterting hurt on Cultist")
	print("entering damage")
	damaged()
	
func damaged():
	print("calling out hurt")
	animation_player.play("hurt")

func handle_animation_finishes(anim_name):
	if(anim_name != "hurt"):
		return
	transitioned.emit(self, "idle")
	
func validate_args(args : Dictionary):
	return args.has_all(["damage"])
