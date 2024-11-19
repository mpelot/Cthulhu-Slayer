extends "res://Scenes/Environment/BossRoom/Script/cthulhu_boss.gd"

func _init():
	GameManager.can_pawn_move = true
	MusicManager.play_song(OST)
