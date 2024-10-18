extends Parallax2D

var player: Player
var old_player_position: Vector2


func _ready():
	player = get_tree().get_first_node_in_group("Player")
	old_player_position = player.position

func _process(delta):
	pass
