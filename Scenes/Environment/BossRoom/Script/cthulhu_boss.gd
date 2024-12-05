extends Node2D

@export var OST: AudioStream
@export var next_scene: String

func _ready():
	MusicManager.play_song(OST)
