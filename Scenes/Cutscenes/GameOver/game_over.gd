extends Control

var time_left: float = 2
var room_path: String = "res://Scenes/Cutscenes/BeforeVillage/before_village.tscn"

func _process(delta):
	time_left -= delta
	if(time_left < 0):
		Global.goto_scene(room_path)
	
