extends Entity
class_name Cthulhu

@export var player : Player
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
	health -= damage.damage * 2

func on_part_damaged(damage: Damagable):
	health -= damage.damage
	pass

func _ready():
	pass

func _process(delta):
	if(not is_following_player):
		return
	position = position.lerp(player.position, delta * 3)
	
