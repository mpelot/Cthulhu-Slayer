extends Node2D

@onready var ambient_ost: AudioStream = preload("res://Scenes/Environment/Village/OST/amb.mp3")

func _ready():
	MusicManager.play_song(ambient_ost)
