extends Control

@onready var intro_beginning: AudioStreamPlayer2D = $IntroBeginning
@onready var intro_loop : AudioStream = preload("res://UI/Scene/OSTs/IntroLooping3s.mp3")

func _ready():
	intro_beginning.play()


func _on_intro_beginning_finished():
	MusicManager.play_song(intro_loop)
