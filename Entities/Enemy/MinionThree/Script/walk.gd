extends EnemyState

@onready var charger: Charger = $"../.."
@onready var animation_player : AnimationPlayer = $"../../AnimationPlayer"
@onready var sprite: Sprite2D = $"../../Sprites/Sprite"

var forget_distance: float = 300
var attack_distance: float = 100
var charge_cool_down: float = 0
var cool_down_duration: float = 3
var movement_speed: float = 5

func enter(args = {}):
	animation_player.play("walk")
	charge_cool_down = cool_down_duration

func update(delta):
	if(distance_to_player(charger.position) > forget_distance):
		transitioned.emit(self, "idle")
	chase(delta)
	charge_cool_down -= delta
	if(charge_cool_down < 0):
		if(distance_to_player(charger.position) < attack_distance):
			transitioned.emit(self, "charge")

func flip_sprite():
	var x_position_difference = -(charger.position - player.position).x
	sprite.flip_h = x_position_difference > 0

func chase(delta):
	flip_sprite()

	var direction = charger.position.direction_to(player.position)
	charger.move_and_collide(direction * movement_speed * delta)
	charger.move_and_slide()
