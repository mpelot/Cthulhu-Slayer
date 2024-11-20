extends Node2D

@onready var animation_player : AnimationPlayer = $AnimationPlayer
var next_scene : String = "res://Scenes/Environment/BossRoom/cthulhu_boss_phase_2.tscn"

func _ready():
	animation_player.play("main")



func _on_animation_player_animation_finished(anim_name):
	if(anim_name == "main"):
		Global.goto_scene(next_scene)
