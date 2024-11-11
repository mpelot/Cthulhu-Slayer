extends Entity

@export var player : Player
var off_set: Vector2 = Vector2(0, 128)

func _process(delta):
	position = position.lerp(player.position, delta * 3)
	
