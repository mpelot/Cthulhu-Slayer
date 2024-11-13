extends State

@onready var arm_slam_scene : PackedScene = preload("res://Entities/Enemy/Cthulhu/ArmAttack/arm_attack.tscn")
@onready var cthulhu : Cthulhu = $"../.."
@onready var left_socket : Node2D = $LeftSocket
@onready var right_socket: Node2D = $RightSocket
@onready var animation_player : AnimationPlayer = $"../../AnimationPlayer"
var is_spawning_after_animation: bool = false

func enter(args = {}):
	animation_player.play("slam")
	is_spawning_after_animation = true

func spawn_arms():
	cthulhu.is_following_player = false
	var left_arm : SlamArm = arm_slam_scene.instantiate()
	left_arm.position = left_socket.global_position
	var right_arm : SlamArm = arm_slam_scene.instantiate()
	right_arm.position = right_socket.global_position
	right_arm.scale = Vector2(-1, 1)
	right_arm.attack_finished.connect(handle_reset_arm)
	get_tree().root.add_child(left_arm)
	get_tree().root.add_child(right_arm)

func handle_reset_arm():
	animation_player.play_backwards("slam")
	cthulhu.is_following_player = true

func handle_to_next_state():
	transitioned.emit(self, "idle")

func _on_animation_player_animation_finished(anim_name):
	if(anim_name == "slam"):
		if(is_spawning_after_animation):
			spawn_arms()
			is_spawning_after_animation = false
		else:
			handle_to_next_state()
