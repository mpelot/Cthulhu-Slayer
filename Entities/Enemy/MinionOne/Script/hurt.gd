extends EnemyState

@onready var cultist : Cultist = $"../.."
@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"

func enter(args = {}):
	assert(validate_args(args), "No damage found whe enterting hurt on Cultist")
	print("entering damage")
	pushed_back(args["damage"].from)
	damaged()
	
func damaged():
	print("calling out hurt")
	animation_player.play("hurt")

func handle_animation_finishes(anim_name):
	if(anim_name != "hurt"):
		return
	transitioned.emit(self, "idle")
func pushed_back(from: Node2D):
	var tween: Tween = get_tree().create_tween()
	var push_vector: Vector2 = (cultist.position - from.position).normalized() * 10
	tween.tween_property(cultist, "position", push_vector + cultist.position, 0.1);
	tween.play()

func validate_args(args : Dictionary):
	return args.has_all(["damage"])
