extends EnemyState

@onready var cultist: Cultist = $"../.."
var forget_distance: float = 500
var attack_distance: float = 30
var movement_speed: float = 50

func update(delta):
	if(distance_to_player(cultist.position) > forget_distance):
		transitioned.emit(self, "idle")
	elif(distance_to_player(cultist.position) < attack_distance):
		transitioned.emit(self, "attack")
	chase(delta)

func chase(delta):
	var direction = cultist.position.direction_to(player.position)
	cultist.move_and_collide(direction * movement_speed * delta)
	cultist.move_and_slide()
