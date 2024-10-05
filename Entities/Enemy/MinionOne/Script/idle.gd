extends EnemyState

@onready var cultist: Cultist = $"../.."
var detect_distance: float = 200

func update(delta):
	if(distance_to_player() < detect_distance):
		transitioned.emit(self, "chaseplayer")
		
	
func distance_to_player():
	return (player.position - cultist.position).length()
