extends EnemyState

@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"
@onready var cultist: Cultist = $"../.."
var attack_distance: float = 30
var is_attacking: bool = false


func enter(args = {}):

	attack()

func attack():
	animation_player.play("attack")
	$"../../Cultist dagger swipe".play()

func update(delta):
	if(is_attacking):
		damage_player()

func handle_animation_finished(anim_name):
	if(anim_name != "attack"):
		return
	if(distance_to_player(cultist.position) > attack_distance):
		transitioned.emit(self, "chaseplayer")
		return
	attack()


func dash_toward_player():
	var direction = (player.position - cultist.position).normalized()
	var dash_tween = get_tree().create_tween()
	var target_position = cultist.position + direction * 40
	dash_tween.tween_property(cultist, "position", target_position, 0.2)
	dash_tween.set_ease(Tween.EASE_OUT)
	is_attacking = true
	dash_tween.play()
	

func damage_player():
	var damage : Damagable = Damagable.new(10, cultist)
	if(distance_between_player(cultist) < 20):
		player.receive_damage(damage)
		$"../../Cultist dagger player contact".play()
		is_attacking = false

func distance_between_player(from: Node2D) -> float:
	return (player.position - from.position).length()
	
