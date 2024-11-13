extends State

@onready var cultist: Cultist = $"../.."
@onready var collider: CollisionShape2D = $"../../CollisionShape2D"

func enter(args = {}):
	cultist.modulate = Color.BLACK;
	GameManager.health += 3
	collider.queue_free()
