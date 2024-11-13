extends EnemyState

var player_position: Vector2
@onready var animation_player : AnimationPlayer = $"../../AnimationPlayer"
@onready var charger : Charger = $"../.."
@onready var collider: CollisionShape2D = $"../../CollisionShape2D"
@onready var player_detect_area : Area2D = $Area2D
var charge_distance : float = 160
var charge_duration: float = 0.3
var charge_counter : float = 0
var should_charge : bool = false

func enter(args = {}):
	player_position = Vector2(player.position)
	animation_player.play("before_charge")
	charge_counter = charge_duration

func _on_animation_player_animation_finished(anim_name):
	if(anim_name == "before_charge"):
		dash()
		animation_player.play("charge")
		if(collider != null):
			collider.disabled = true
		player_detect_area.monitoring = true

func dash():
	var direction: Vector2 = (player_position - charger.position).normalized()
	var target_position = direction * charge_distance + charger.position
	var tween: Tween = get_tree().create_tween()
	tween.tween_property(charger, "position", target_position, charge_duration)
	tween.play()
	tween.finished.connect(handle_charge_finished)
	 

func handle_charge_finished():
	should_charge = false
	transitioned.emit(self, "idle")
	player_detect_area.monitoring = false
	if(collider != null):
		collider.disabled = false
	animation_player.play("walk")


func _on_area_2d_body_entered(body):
	if(body is Player):
		var damagable : Damagable = Damagable.new(40, charger)
		GameManager.frame_freeze(0.1, 0.35)
		body.receive_damage(damagable)
