extends State

@onready var animation_player : AnimationPlayer = $"../../AnimationPlayer"

func enter(arg = {}):
	animation_player.play("hurt")

func _on_animation_player_animation_finished(anim_name):
	if(anim_name == "hurt"):
		transitioned.emit(self, "walk")
