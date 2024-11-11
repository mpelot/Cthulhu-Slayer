extends Node2D


@onready var beam_prefab: Node2D = preload("res://Entities/Enemy/Cthulhu/Beam/beam.tscn").instantiate()
var num_beam: int = 40


func _ready():
	
	for i in range(num_beam/2 + 1):
		var beam_rotation = i * PI/(num_beam)
		add_beam(beam_rotation)
		add_beam(-beam_rotation)
		
		

func add_beam(radian: float):
	var beam: Node2D = beam_prefab.duplicate()
	beam.rotate(radian)
	add_child(beam)
