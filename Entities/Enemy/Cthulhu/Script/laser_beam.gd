extends State

@onready var cthulhu : Cthulhu = $"../.."
@onready var laser_scene: PackedScene = preload("res://Entities/Enemy/Cthulhu/Beam/beam_bunch.tscn")


func enter(args = {}):
	var laser : Node2D = laser_scene.instantiate()
	laser.beam_finished.connect(handle_beam_finished)
	add_child(laser)
	cthulhu.is_following_player = false


func handle_beam_finished():
	transitioned.emit(self, "idle")
	cthulhu.is_following_player = true
