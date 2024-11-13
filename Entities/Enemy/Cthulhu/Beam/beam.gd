extends Node2D
class_name Beam


@onready var sprite : Sprite2D = $Sprite2D
var beam_length: float = 400
var direction : Vector2
var space_state

func on_start():
	space_state = get_world_2d().direct_space_state
	# use global coordinates, not local to node
	direction = Vector2(0,beam_length).rotated(rotation)
	var query = PhysicsRayQueryParameters2D.create(global_position, direction + global_position)
	var result = space_state.intersect_ray(query)
	var intersection: Vector2
	if(!result.is_empty()):
		intersection = result["position"]
	else:
		intersection = global_position + direction

	var target_size = Vector2(1, (intersection - global_position).length()/30)
	
	var target_position = Vector2(0, (intersection - global_position).length()/2)

	var position_tween = get_tree().create_tween()
	var size_tween = get_tree().create_tween()
	
	position_tween.tween_property(sprite, "position", target_position, 1)
	size_tween.tween_property(sprite, "scale", target_size, 1)
	position_tween.play()
	size_tween.play()

func _ready():
	on_start()

func _process(delta):
	var intersection: Vector2 = detect_intersection_change()
	if(intersection == Vector2.INF):
		return
	readjust_size(intersection)
	

func detect_intersection_change():
	var query = PhysicsRayQueryParameters2D.create(global_position, direction + global_position)
	var result : Dictionary = space_state.intersect_ray(query)
	if(result.is_empty()):
		return Vector2.INF
	else:
		return result["position"]

func readjust_size(intersection: Vector2):
	var target_size = Vector2(1, (intersection - global_position).length()/30)
	var target_position = Vector2(0, (intersection - global_position).length()/2)
	sprite.position = target_position
	sprite.scale = target_size
