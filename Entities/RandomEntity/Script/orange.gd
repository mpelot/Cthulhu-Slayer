extends State

@export var sprite: Sprite2D

func enter(args = {}):
	sprite.modulate = Color.ORANGE

func update(delta):
	if(Input.is_action_just_pressed("Shoot")):
		transitioned.emit(self, "blue")
