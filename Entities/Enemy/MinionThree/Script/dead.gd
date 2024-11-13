extends State

@onready var animation_player : AnimationPlayer = $"../../AnimationPlayer"
@onready var collider : CollisionShape2D = $"../../CollisionShape2D"
@onready var sprite : Sprite2D = $"../../Sprites/Sprite"

func enter(arg = {}):
	
	GameManager.health += 7
	collider.queue_free()
	animation_player.play("die")
