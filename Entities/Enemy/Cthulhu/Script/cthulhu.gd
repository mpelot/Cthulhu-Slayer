extends Entity
class_name Cthulhu

@export var next_scene : String = "res://Scenes/Cutscenes/PhaseTransition/phase_transition.tscn"
@export var player : Player
@export var is_phase_2: bool = false
@onready var health_bar : CthulhuHealthBar = $Healthbar
var off_set: Vector2 = Vector2(0, 200)
var is_following_player: bool = true
var health: float = 5000:
	set(value):
		on_health_change(value)
		health = value


func on_health_change(value):
	health_bar.handle_health_change(value)
	
func receive_damage(damage: Damagable):
	if(damage.from is CthulhuChessPiece):
		return
	health -= damage.damage * 2
	if(health < 0):
		Global.goto_scene(next_scene)

func on_part_damaged(damage: Damagable):
	health -= damage.damage
	pass

func _ready():
	if(is_phase_2):
		$Sprites/AgroHead.visible = true
		$Sprites/Head.visible = false
		$HeadAnimation.play("agro")

func _process(delta):
	if(not is_following_player):
		return
	position = position.lerp(player.position, delta * 3)
	
