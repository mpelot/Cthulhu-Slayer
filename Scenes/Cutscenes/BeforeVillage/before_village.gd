extends Control

var next_scene : String = "res://Scenes/Environment/Village/village_1st_part.tscn"



func _on_video_stream_player_finished():
	Global.goto_scene(next_scene)
