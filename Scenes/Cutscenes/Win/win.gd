extends Node2D

@onready var animation_player : AnimationPlayer = $AnimationPlayer

func _ready():
	animation_player.play("main")


func _on_animation_player_animation_finished(anim_name):
	Global.goto_scene("res://UI/Scene/Menu/menu.tscn")
