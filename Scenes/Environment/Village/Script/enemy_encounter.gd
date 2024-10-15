extends Area2D

@onready var vespertine: AudioStream = preload("res://Scenes/Environment/Village/OST/Vespertine2.mp3")

func _on_body_entered(body):
	if(body is Player):
		MusicManager.play_song(vespertine)
