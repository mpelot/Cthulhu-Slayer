extends EnemyState

@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"
@onready var cultist: Cultist = $"../.."
var attack_distance: float = 30

func enter(args = {}):

	attack()

func attack():
	animation_player.play("attack")

func handle_animation_finished(anim_name):
	if(anim_name != "attack"):
		return
	if(distance_to_player(cultist.position) > attack_distance):
		transitioned.emit(self, "chaseplayer")
		return
	attack()

func damage_player():
	var damage : Damagable = Damagable.new(10, cultist)
	if(distance_between_player(cultist) < 20):
		player.receive_damage(damage)

func distance_between_player(from: Node2D) -> float:
	return (player.position - from.position).length()
	
