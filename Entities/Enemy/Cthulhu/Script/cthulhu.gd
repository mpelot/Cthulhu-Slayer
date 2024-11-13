extends Entity
class_name Cthulhu

@export var player : Player
var off_set: Vector2 = Vector2(0, 200)
var is_following_player: bool = true


func _process(delta):
	if(not is_following_player):
		return
	position = position.lerp(player.position, delta * 3)
	
