extends Node2D

@onready var ost: AudioStream = preload("res://Scenes/Environment/Seashore/OST/0998.mp3")

func _ready():
	MusicManager.play_song(ost)
