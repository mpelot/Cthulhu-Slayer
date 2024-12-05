extends State
class_name Agro

var movement_duration: float = 0.3
var idle_time: float = 0.1
var charge_time: float = 0.1
var retreat: bool = false
@onready var animation_player : AnimationPlayer = $"../../Sprite/AnimationPlayer"


func enter(args = {}):
	$Timer.start()
	animation_player.play("to_agro")
	
func _on_animation_player_animation_finished(anim_name):
	if(anim_name == "to_agro"):
		animation_player.play("agro")


func _on_timer_timeout():
	transitioned.emit(self, "normal")
