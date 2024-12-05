extends TileMapLayer

@onready var footstep_player: AudioStreamPlayer2D = $"../Player Gravel Run SFX"
@export var gravel_coords_list: Array[Vector2i] = [
	Vector2i(4,0)]
	
var last_played_coords: Vector2i = Vector2i(-1,-1)

func play_footsteps_if_on(world_position: Vector2, is_moving:bool):
	var local_postion = to_local(world_position)
	var cell = local_to_map(local_postion)
	var current_coords = get_cell_atlas_coords(cell)
	
	print("village3 ground Cell coordinates:", current_coords)
	if is_moving and current_coords in gravel_coords_list:
		if footstep_player and not footstep_player.playing:
			footstep_player.play()
			last_played_coords = current_coords
	else:
		footstep_player.stop()
