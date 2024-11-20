extends Control

var time_left: float = 2
var room_path: String = "res://Scenes/Cutscenes/WakeUp/wake_up.tscn"
var did_goto_scene: bool = false
@onready var animation_player : AnimationPlayer = $AnimationPlayer


	
func _ready():
	animation_player.play("die")

func _on_animation_player_animation_finished(anim_name):
	MusicManager.pause()
	GameManager.health = 100
	Global.goto_scene(room_path)
	did_goto_scene = true
	
