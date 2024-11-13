extends State

@export var sprite: Sprite2D
@export var entity: CharacterBody2D

func enter(args={}):
	sprite.modulate = Color.RED
	
#If Melee, change state to green	
func update(delta):
	var movement: float = Input.get_action_raw_strength("Down")
	entity.move_and_collide(Vector2(movement * 100, 0))

