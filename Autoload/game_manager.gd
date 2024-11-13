#The game manager is responsible with managing global variables and functions that we will need 
#to propagate through different scene. 
extends Node

var game_over_path: String = "res://Scenes/Cutscenes/GameOver/game_over.tscn"


signal on_health_change(health: float)
var health: float = 100 :
	get:
		return health
	set(value):
		on_health_change.emit(value)
		if(value >= 100):
			on_health_full()
		elif(value <= 0):
			on_health_empty()
		health = clamp(value, 0, 100)

signal on_camera_shake

func on_health_full():
	pass
	
func on_health_empty():
	Global.goto_scene(game_over_path)

func frame_freeze(time_scale: float, duration: float):
	Engine.time_scale = time_scale
	await get_tree().create_timer(duration * time_scale).timeout
	Engine.time_scale = 1

