extends State

@onready var cultist: Cultist = $"../.."
@onready var collider: CollisionShape2D = $"../../CollisionShape2D"

func enter(args = {}):
	cultist.modulate = Color.BLACK;
	collider.queue_free()
	$"../../Cultist dagger swipe".stop()
