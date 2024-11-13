extends Node2D

@onready var canvas : CanvasGroup = $CanvasGroup
@onready var beam_prefab: Node2D = preload("res://Entities/Enemy/Cthulhu/Beam/beam.tscn").instantiate()
var num_beam: int = 120
var current_rotation = 0
var increment: float
signal beam_finished

func _ready():
	increment = PI/num_beam
	$AnimationPlayer.play("beam")
	$Timer.start()




func add_beam(radian: float):
	var beam: Node2D = beam_prefab.duplicate()
	beam.rotate(radian)
	canvas.add_child(beam)


func _on_timer_timeout():
	if(current_rotation >= PI/2):
		return
	$Timer.start()
	add_beam(current_rotation)
	add_beam(-current_rotation)

	current_rotation += increment

func beam_fade():
	beam_finished.emit()
	queue_free()
