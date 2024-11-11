extends State

@onready var chess_piece : CthulhuChessPiece = $"../../.."
@onready var attacking_state: HierachyMachine = $".."

var player : Player

func _ready():
	player = get_tree().get_first_node_in_group("Player")
	chess_piece.dashing_finished.connect(on_dash_finished)

#Each square on the chessboard is 112 x 112 pixels (7 x 7 tiles)
func enter(args = {}):
	var angle = get_angle_to_player()
	var difference : float = (player.position - chess_piece.position).length()
	
	var move_magnitude = (difference - fmod(difference,128.0)) + 128
	print("magnitude: " + str(move_magnitude))
	var move_direction = Vector2i(Vector2.from_angle(angle) * 2)
	
	var move_vector = Vector2(sign(move_direction.x), sign(move_direction.y)) * move_magnitude
	var target_position = chess_piece.position + move_vector
	chess_piece.set_target(target_position)
	print("DASHING")
	
func on_dash_finished():
	attacking_state.transitioned.emit(attacking_state, "idle")

func get_distance_to_bound(direction: Vector2):
	var space_state = get_world_2d().direct_space_state
	# use global coordinates, not local to node
	var query = PhysicsRayQueryParameters2D.create(chess_piece.position, direction * 3000)
	var result  = space_state.intersect_ray(query)
	


func get_angle_to_player():
	var angle = chess_piece.get_angle_to(player.position)
	return get_discrete_rotation(angle)
	
	
func get_discrete_rotation(radian):
	return snapped(radian, PI/4)
	
