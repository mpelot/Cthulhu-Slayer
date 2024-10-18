extends Area2D

@export var next_scene: String




func _on_body_entered(body):
	if (next_scene == null):
		return
	if (body is Player):
		Global.goto_scene(next_scene)
	
