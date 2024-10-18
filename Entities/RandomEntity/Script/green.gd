extends State

@onready var sprite: Sprite2D = $"../../Sprite2D"


func enter(args = {}):
	sprite.modulate = Color.GREEN
	
