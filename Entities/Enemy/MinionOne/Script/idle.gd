extends EnemyState

@onready var cultist: Cultist = $"../.."
var detect_distance: float = 100

func enter(args = {}):
	pass

func update(delta):
	if(distance_to_player(cultist.position) < detect_distance):
		transitioned.emit(self, "chaseplayer")
	else:
		wander()		

func wander():
	pass
