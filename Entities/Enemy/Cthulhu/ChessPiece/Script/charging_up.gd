extends State

@onready var animation_player : AnimationPlayer = $CharginUp

func enter(args = {}):
	animation_player.play("charging_up")


func _on_chargin_up_animation_finished(anim_name):
	if(anim_name == "charging_up"):
		transitioned.emit(self, "move")
