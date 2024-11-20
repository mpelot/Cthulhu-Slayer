extends EnemyState
class_name QueenMove

@onready var damage_area : Area2D = %DamageArea
@onready var chess: CthulhuChessPiece = $"../../.."
@onready var parent_machine : HierachyMachine = $".."
@onready var spot_reservation_scene : PackedScene = preload("res://Scenes/Environment/BossRoom/ChessPieces/Pawn/spot_reservation.tscn")
#Hard coding this part because it is just easier
var possible_directions: Array[Vector2] = [
	Vector2(1,0), Vector2(-1,0),
	Vector2(0,1), Vector2(0,-1),
]
var resevation : Area2D
var check_distance : float = 128

@onready var space_state = get_world_2d().direct_space_state

func enter(args = {}):
	var availables = available_direction(possible_directions)
	var move_direction = closest_distance_to_target(availables, player.position)
	move(move_direction)

func move(direction: Vector2):
	
	var tween: Tween = get_tree().create_tween()
	spawn_reservation(chess.global_position + direction)
	tween.tween_property(chess, "position", chess.position + direction, 0.8)
	tween.play()
	tween.finished.connect(on_move_finished)
	damage_area.monitoring = true
	
func spawn_reservation(pos: Vector2):
	resevation = spot_reservation_scene.instantiate()
	resevation.position = pos
	get_tree().root.add_child(resevation)
	

func on_move_finished():
	parent_machine.transitioned.emit(parent_machine, "idle")
	resevation.queue_free()
	resevation = null
	damage_area.monitoring = false

func spawn_collider_at_destination():
	pass

func closest_distance_to_target(directions: Array[Vector2], target: Vector2) -> Vector2:
	if(len(directions) == 0):
		return Vector2.ZERO
	var difference = (target - chess.position).normalized()
	var direction: Vector2 = directions[0]
	var max_value : float = -direction.dot(difference)
	for dir in directions:
		if(-dir.dot(difference) < max_value):
			direction = dir
			max_value = -dir.dot(difference)
	return direction

func available_direction(directions : Array[Vector2]) -> Array[Vector2]:
	var availables: Array[Vector2]
	for direction in directions:
		if(not check_direction(direction * check_distance)):
			availables.append(direction * check_distance)
	return availables

#true if there is collider in the path of the ray case
func check_direction(direction : Vector2):
	var query = PhysicsRayQueryParameters2D.create(global_position, direction + global_position, 3)
	query.collide_with_areas = true
	var result : Dictionary = space_state.intersect_ray(query)
	return not result.is_empty()

	
