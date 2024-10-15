extends Node2D
class_name Pivot


func _process(_delta: float):
	var mouse_direction: Vector2 = get_global_mouse_position() - global_position
	var compare_direction: Vector2 = Vector2(1,0)
	rotation = discrete_rotation(compare_direction.angle_to(mouse_direction))
	

func discrete_rotation(radian: float):
	return radian - fmod(radian,PI/4)
	
