extends Entity
class_name CthulhuChessPiece

var move_speed : float = 200
var target_position: Vector2
var is_dashing : bool = false
signal dashing_finished

func _ready():
	target_position = position

func set_target(target: Vector2):
	target_position = target
	print(target_position)
	is_dashing = true
	
func _process(delta):
	if(not is_dashing):
		return
	if((target_position - position).length() < 10):
		is_dashing = false
		print("finished dashing")
		dashing_finished.emit()
		return
	var direction = (target_position - position).normalized()
	var collision = move_and_collide(direction * delta * move_speed)


	
