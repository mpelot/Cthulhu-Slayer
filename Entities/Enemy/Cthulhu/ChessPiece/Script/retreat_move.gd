extends QueenMove


func enter(args = {}):
	assert(args.has_all(["target_position"]))
	var availables = available_direction(possible_directions)
	var move_direction = closest_distance_to_target(availables, args["target_position"])
	move(move_direction)
