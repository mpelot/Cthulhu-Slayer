extends Control

var time_left: float = 2
var room_path: String = "res://Scenes/Cutscenes/WakeUp/wake_up.tscn"
var did_goto_scene: bool = false

func _process(delta):
	if(did_goto_scene):
		return
	time_left -= delta
	if(time_left < 0):
		MusicManager.pause()
		Global.goto_scene(room_path)
		did_goto_scene = true
	
