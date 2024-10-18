extends State
class_name EnemyState

var player: Player

func _ready():
	player = get_tree().get_first_node_in_group("Player")
	assert(player != null, "An enemy state can't find the player")

func distance_to_player(pos: Vector2):
	return (player.position - pos).length()
