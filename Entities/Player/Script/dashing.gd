extends State

@onready var player : Player = $"../.."
@onready var collider: CollisionShape2D = $"../../CollisionShape2D"
@onready var run_player : AnimationPlayer = $"../../Sprite/Run/Run"
@onready var player_stats: PlayerStats = $"../../PlayerStats"

var dash_speed : float = 300
var dash_duration: float = 0.1
var dash_direction : Vector2 
var time_left: float

#Dash limiter
var dash_multiplier: float = 1
var per_dash_decrease: float = 0.4
var dash_replenish: float = 0.6

func enter(args = {}):
	validate_args(args)
	time_left = dash_duration * dash_multiplier
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
		dash_multiplier -= per_dash_decrease
		dash_multiplier = max(0, dash_multiplier)
		#Transition back to control
		transitioned.emit(self, "Control (BM)")

func exit():
	run_player.play("Run")	

func _process(delta: float) -> void:
	dash_multiplier += dash_replenish * delta
	dash_multiplier = min(1, dash_multiplier)
	player_stats.update_stamina_bar(dash_multiplier)
