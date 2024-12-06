extends Control

@export var credits : Array[HBoxContainer]
@onready var animation_player : AnimationPlayer = $AnimationPlayer
@onready var head_player : AnimationPlayer = $MarginContainer/Sprite2D/HeadPlayer
@export var audio_stream: AudioStream = preload("res://UI/Scene/OSTs/Intro.mp3") as AudioStream

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animation_player.play("main")
	head_player.play("head")
	MusicManager.play_song(audio_stream)

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	Global.goto_scene("res://Scenes/Cutscenes/WakeUp/wake_up_won.tscn")
