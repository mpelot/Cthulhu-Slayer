extends EnemyState

var player_position: Vector2
@onready var animation_player : AnimationPlayer = $"../../AnimationPlayer"
@onready var charger : Charger = $"../.."
var charge_speed : float = 400
var charge_duration: float = 1
var charge_counter : float = 0
var should_charge : bool = false

func enter(args = {}):
	player_position = Vector2(player.position)
	animation_player.play("before_charge")
	charge_counter = charge_duration

func _on_animation_player_animation_finished(anim_name):
	if(anim_name == "before_charge"):
		should_charge = true
		animation_player.play("charge")
		
func update(delta):
	if(not should_charge):
		return
	if(charge_counter < 0):
		should_charge = false
		transitioned.emit(self, "idle")
		animation_player.play("walk")
		return
	charge_counter -= delta
	var direction: Vector2 = (player_position - charger.position).normalized()
	charger.move_and_collide(direction * charge_speed * delta)
