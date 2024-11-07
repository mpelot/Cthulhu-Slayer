extends Node2D
class_name Pivot

@onready var attack_sprite: Sprite2D = $Attacks
@onready var attack_player: AnimationPlayer = $Attacks/AnimationPlayer
@onready var weapon : Area2D = $MeleeWeapon

signal attack_finished

func _ready():
	attack_player.animation_finished.connect(animation_finishes)
	visible = false

func attack():
	visible = true

	var mouse_direction: Vector2 = get_global_mouse_position() - global_position
	var compare_direction: Vector2 = Vector2(0,-1)
	
	var angle = discrete_rotation(compare_direction.angle_to(mouse_direction))
	weapon.rotation = angle
	set_attack_direction(discrete_angle(angle))
	run_animation(discrete_angle(angle))

func animation_finishes(anim_name):
	visible = false

	attack_finished.emit()

func set_attack_direction(discrete_angle: int):
	if(discrete_angle != 0):
		var direction = sign(discrete_angle)
		attack_sprite.flip_h = direction == -1
		
func run_animation(discrete_angle: int):
	var abs_angle = abs(discrete_angle)
	if(abs_angle == 0):
		attack_player.play("up")
	if(abs_angle == 90):
		attack_player.play("left")
	if(abs_angle == 45):
		attack_player.play("up_right")
	if(abs_angle == 135):
		attack_player.play("down_right")
	if(abs_angle == 180):
		attack_player.play("down")

func discrete_angle(rad: float):
	return int(rad_to_deg(rad))

func discrete_rotation(radian: float):
	var degree = rad_to_deg(radian)
	var discrete_degree = degree 
	var discrete_angle = snapped(radian, PI/4)
	print("ANGLE: " + str(rad_to_deg(discrete_angle)))
	return discrete_angle
	
