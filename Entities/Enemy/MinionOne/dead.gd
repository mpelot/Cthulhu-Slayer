extends State

@onready var cultist: Cultist = $"../.."
@onready var collider: CollisionShape2D = $"../../CollisionShape2D"
@onready var animation_player : AnimationPlayer = $"../../AnimationPlayer"

func enter(args = {}):
	cultist.modulate = Color.BLACK;
	GameManager.health += 3
	animation_player.play("die")
	collider.queue_free()
