extends Entity
class_name CthulhuChessPiece

var move_speed : float = 200
var target_position: Vector2
var is_dashing : bool = false
@export var cthulhu: Cthulhu
@onready var agro_sm : AgroStateMachine = $AgroStateMachine

signal dashing_finished

func _ready():
	target_position = position

func set_target(target: Vector2):
	target_position = target
	is_dashing = true
	
func _process(delta):
	pass

func receive_damage(damage:Damagable):
	if(damage.from is Player):
		agro_sm.set_agro_state("retreat")
		cthulhu.receive_damage(damage)
	

	
