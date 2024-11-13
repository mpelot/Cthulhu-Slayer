extends Entity
class_name SlamArm

signal attack_finished
signal on_damaged(damage: Damagable)

func _ready():
	
	$Pivot/AnimationPlayer.play("arm_slam")

func _on_animation_player_animation_finished(anim_name):
	queue_free()
	
func finish_arm_slam():
	attack_finished.emit()

func receive_damage(damage: Damagable):
	on_damaged.emit(damage)


func _on_damage_area_body_entered(body):
	if(body is Player):
		var damage: Damagable = Damagable.new(30, self)
		body.receive_damage(damage)
	
