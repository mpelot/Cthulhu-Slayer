extends Node2D

@export var OST: AudioStream
@export var next_scene: String = "res://Scenes/Cutscenes/PhaseTransition/phase_transition.tscn"

func _ready():
	MusicManager.play_song(OST)
