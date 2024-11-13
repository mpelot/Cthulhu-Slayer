extends Control

var next_scene : String = "res://Scenes/Environment/Village/village_1st_part.tscn"
@onready var song : AudioStream = preload("res://Scenes/Environment/Village/OST/Vespertine2.mp3")

func _ready():
	GameManager.health = 100
	MusicManager.play_song(song)

func _on_video_stream_player_finished():
	Global.goto_scene(next_scene)
	
	