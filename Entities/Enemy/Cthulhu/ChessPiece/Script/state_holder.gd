extends EnemyState

@onready var chess: CthulhuChessPiece = $"../../.."
var target_position: Vector2 = Vector2.INF

func enter(args = {}):
	if(target_position == Vector2.INF):
		var targets = get_tree().get_nodes_in_group("RetreatTargets")
		var targets_2d: Array[Node2D]
		for target in targets:
			if(target is Node2D):
				targets_2d.append(target)
		target_position = best_target_location(targets_2d)
	$Timer.start()
	

func best_target_location(targets: Array[Node2D]):
	var max_distance : float = 0
	var best_target = null
	for target in targets:
		if(distance_to_player(target.position) > max_distance):
			best_target = target
			max_distance = distance_to_player(target.position)
	return best_target.position
	
func exit():
	if(target_position.distance_to(chess.position) < 100):
		#Move to rest
		target_position = Vector2.INF
		


func _on_timer_timeout():
	if(target_position.distance_to(chess.position) < 100):
		#Move to rest
		target_position = Vector2.INF
		transitioned.emit(self, "rest")
	else:
		transitioned.emit(self, "move", {"target_position": target_position})
