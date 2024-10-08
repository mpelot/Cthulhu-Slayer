extends Behavior

@onready var player: CharacterBody2D = $"../../.."
@onready var control_state: State = %"Control (BM)"
@export var movement_speed: float = 1000

func update(delta):
	var collision: KinematicCollision2D = move(delta)
	#Collision can return null 
	handle_collision(collision)

func move(delta) -> KinematicCollision2D:
	var x_input : float = Input.get_action_raw_strength("Right") - Input.get_action_raw_strength("Left")
	var y_input: float = Input.get_action_raw_strength("Down") - Input.get_action_raw_strength("Up")
	return (player.move_and_collide(Vector2(x_input, y_input).normalized() * movement_speed * delta))
	
#Handling the collision here
func handle_collision(collision: KinematicCollision2D):
	if(collision == null):
		return #Or a different way to handle collision from here
	var collider := collision.get_collider()
	if(collider is Damagable):
		control_state.transitioned.emit(control_state, {"damage": collider.damage})
	
