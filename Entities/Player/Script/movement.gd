extends Behavior

@onready var player: CharacterBody2D = $"../../.."
@onready var control_state: State = %"Control (BM)"
@export var movement_speed: float = 1000
@onready var sprite: Node2D = $"../../../Sprite"
@onready var run_sprite: Sprite2D = $"../../../Sprite/Run"
@onready var idle_sprite: Sprite2D = $"../../../Sprite/Idle"
@onready var run_animation: AnimationPlayer = $"../../../Sprite/Run/Run"
@onready var idle_animation: AnimationPlayer = $"../../../AnimationPlayer"

@onready var previous_position: Vector2
@onready var footstep_layers = get_tree().get_nodes_in_group("footstep_layers")


func _ready():
	run_animation.play("Run")
	idle_animation.play("Idle")
	previous_position = player.global_position
		
func _process(delta):
	check_footsteps()
	previous_position = player.global_position

func update(delta):
	var collision: KinematicCollision2D = move(delta)
	#Collision can return null 
	handle_collision(collision)
	

func move(delta) -> KinematicCollision2D:
	var x_input : float = Input.get_action_raw_strength("Right") - Input.get_action_raw_strength("Left")
	var y_input: float = Input.get_action_raw_strength("Down") - Input.get_action_raw_strength("Up")
	var direction = Vector2(x_input, y_input).normalized()
	if(direction.length() > 0.1):
		idle_sprite.visible = false
		run_sprite.visible = true
		if(x_input < 0):
			sprite.scale = Vector2(-1, 1)
		else:
			sprite.scale = Vector2(1, 1)
	else:
		idle_sprite.visible = true
		run_sprite.visible = false
	return (player.move_and_collide(direction * movement_speed * delta))
		
#Handling the collision here
func handle_collision(collision: KinematicCollision2D):
	if(collision == null):
		return #Or a different way to handle collision from here
	var collider := collision.get_collider()
	if(collider is Damagable):
		control_state.transitioned.emit(control_state, {"damage": collider.damage})
	
func check_footsteps():
	var player_position = player.global_position
	var is_moving = player_position != previous_position
	for layer in footstep_layers:
		if layer.has_method("play_footsteps_if_on"):
			layer.play_footsteps_if_on(player_position, is_moving)
