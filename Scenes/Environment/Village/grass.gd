extends TileMapLayer

@onready var footstep_player: AudioStreamPlayer2D = $"../PlayerGrassRunSFX"
@export var atlas_coords_list: Array[Vector2i] = [
	Vector2i(9,0), Vector2i(6,3), Vector2i(11,2), Vector2i(5,3),
	Vector2i(4,3), Vector2(4,0)]
	
	#Vector2i(5,2), Vector2i(6,2), Vector2i(6,3), Vector2i(7,3), 
	#Vector2i(8,2), Vector2i(9,2), Vector2i(10,3), Vector2i(11,3), 
	#Vector2i(13,2), Vector2i(0,3), Vector2i(1,3), Vector2i(2,3),
	#Vector2i(3,3), Vector2i(4,3), Vector2i(5,3), Vector2i(6,3),
	#Vector2i(7,3), Vector2i(8,3), Vector2i(9,0), Vector2i(4,0)] 
	
@onready var last_played_coords: Vector2i = Vector2i(-1,-1)

func play_footsteps_if_on(world_position: Vector2, is_moving:bool):
	var cell = local_to_map(world_position)
	var current_coords = get_cell_atlas_coords(cell)
	#print("grass - Cell coordinates:", current_coords)
	if is_moving and current_coords in atlas_coords_list:
		if footstep_player and not footstep_player.playing:
			footstep_player.play()
			last_played_coords = current_coords
	else:
		footstep_player.stop()
