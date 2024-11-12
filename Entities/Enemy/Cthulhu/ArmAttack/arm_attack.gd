extends CharacterBody2D
class_name SlamArm

signal attack_finished

func _ready():
	print("ARM IS BORNED")
	$Pivot/AnimationPlayer.play("arm_slam")

func _on_animation_player_animation_finished(anim_name):
	queue_free()
	
func finish_arm_slam():
	attack_finished.emit()
