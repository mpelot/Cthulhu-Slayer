extends Behavior

@onready var player: CharacterBody2D = $"../../.."
@export var movement_speed: float = 100

func update(delta):
	var x_input : float = Input.get_action_raw_strength("Right") - Input.get_action_raw_strength("Left")
	var y_input: float = Input.get_action_raw_strength("Down") - Input.get_action_raw_strength("Up")
	
	player.move_and_collide(Vector2(x_input, y_input) * movement_speed * delta)
