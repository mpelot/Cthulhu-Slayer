extends Node2D

@onready var animation_player : AnimationPlayer = $AnimationPlayer
@onready var audio_player: AudioStreamPlayer2D = $AudioStreamPlayer2D
var current_song : AudioStream

func play_song(song : AudioStream):
	if(song == current_song):
		print("Song is the current song")
		return
	current_song = song
	print("MUSIC MANAGER: playing song " + song.resource_name)
	animation_player.play("fade_out")
	
	
func on_to_next_song():
	pass

func pause():
	audio_player.stop()

func play():
	audio_player.play()
	
func _on_animation_player_animation_finished(anim_name):
	if (anim_name == "fade_out"):
		audio_player.stream = current_song
		animation_player.play("fade_in")
		audio_player.play()
