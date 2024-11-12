extends EnemyState

@onready var charger : Charger = $"../.."

func update(delta):
	
	if(distance_to_player(charger.position) < 300):
		transitioned.emit(self, "walk")
		
