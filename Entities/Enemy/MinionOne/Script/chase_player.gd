extends EnemyState

@onready var cultist: Cultist = $"../.."
@onready var animation_player : AnimationPlayer = $"../../AnimationPlayer"
@onready var sprite: Sprite2D = $"../../Sprite/Sprite2D"

var forget_distance: float = 300
var attack_distance: float = 50
var movement_speed: float = 50

func enter(args = {}):
	animation_player.play("chase")

func update(delta):
	if(distance_to_player(cultist.position) > forget_distance):
		transitioned.emit(self, "idle")
	elif(distance_to_player(cultist.position) < attack_distance):
		transitioned.emit(self, "attack")
	chase(delta)


func flip_sprite():
	var x_position_difference = (cultist.position - player.position).x
	sprite.flip_h = x_position_difference > 0

func chase(delta):
	flip_sprite()
	var direction = cultist.position.direction_to(player.position)
	cultist.move_and_collide(direction * movement_speed * delta)
	cultist.move_and_slide()
