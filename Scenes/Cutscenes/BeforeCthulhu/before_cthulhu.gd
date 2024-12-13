extends Node2D

@onready var animation_player : AnimationPlayer = $AnimationPlayer
@onready var eye_video : VideoStreamPlayer = $CanvasLayer/Control/VideoStreamPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animation_player.play("main")

func play_video():
	eye_video.play()

func pause_video():
	eye_video.stop()

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	Global.goto_scene("res://Scenes/Environment/BossRoom/cthulhu_boss.tscn")
