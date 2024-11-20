extends State

@onready var animation_player : AnimationPlayer = $CharginUp

func enter(args = {}):
	animation_player.play("charging_up")
	$Timer.start()



func _on_chargin_up_animation_finished(anim_name):
	pass


func _on_timer_timeout():
	transitioned.emit(self, "move")
