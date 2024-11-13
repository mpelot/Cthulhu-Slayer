extends State

@onready var animation_player : AnimationPlayer = $"../../AnimationPlayer"
@onready var collider : CollisionShape2D = $"../../CollisionShape2D"
@onready var sprite : Sprite2D = $"../../Sprites/Sprite"

func enter(arg = {}):
	sprite.modulate = Color.BLACK
	GameManager.health += 7
	collider.queue_free()
