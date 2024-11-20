extends State

@onready var player : Player = $"../.."
@onready var collider: CollisionShape2D = $"../../CollisionShape2D"
@onready var run_player : AnimationPlayer = $"../../Sprite/Run/Run"
var dash_speed : float = 300
var dash_duration: float = 0.1
var dash_direction : Vector2 
var time_left: float


func enter(args = {}):
	validate_args(args)
	time_left = dash_duration
	dash_direction = args["direction"]
	collider.disabled = true
	run_player.play("dash")
	
func validate_args(args: Dictionary):
	assert(args.has_all(["direction"]))

func update(delta):
	time_left -= delta
	player.move_and_collide(dash_direction * dash_speed * delta)
	if(time_left < 0):
		collider.disabled = false
		#Transition back to control
		transitioned.emit(self, "Control (BM)")

func exit():
	run_player.play("Run")	
