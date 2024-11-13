extends Node2D

@export var OST: AudioStream


func _ready():
	MusicManager.play_song(OST)
