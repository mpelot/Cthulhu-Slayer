extends EnemyState

@onready var cultist: Cultist = $"../.."
var detect_distance: float = 200
var total_rest_time : float = 2
var current_rest_time : float = 0

func enter(args = {}):
	current_rest_time = total_rest_time

func update(delta):
	
	if(current_rest_time > 0):
		current_rest_time -= delta
		return
	if(distance_to_player(cultist.position) < detect_distance):
		transitioned.emit(self, "chaseplayer")
	else:
		wander()		

func wander():
	pass
