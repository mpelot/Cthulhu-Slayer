extends Node2D
class_name Beam

@onready var sprite : Sprite2D = $Sprite2D

func on_start():
	var space_state = get_world_2d().direct_space_state
	# use global coordinates, not local to node
	var direction = Vector2(0,500).rotated(rotation)
	var query = PhysicsRayQueryParameters2D.create(Vector2(0, 0), direction)
	var result = space_state.intersect_ray(query)
	var intersection: Vector2
	if(!result.is_empty()):
		intersection = result["position"]
	else:
		intersection = global_position + direction
	print(intersection, global_position)
	var target_size = Vector2(1, (intersection - global_position).length()/30)
	
	var target_position = (intersection - sprite.position)/2
	print(target_position)
	var position_tween = get_tree().create_tween()
	var size_tween = get_tree().create_tween()
	
	position_tween.tween_property(sprite, "global_position", target_position, 0.3)
	size_tween.tween_property(sprite, "scale", target_size, 0.3)
	position_tween.play()
	size_tween.play()

func _ready():
	on_start()
