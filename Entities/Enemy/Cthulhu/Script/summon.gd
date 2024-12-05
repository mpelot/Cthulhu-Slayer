extends State

@onready var cultist_scene : PackedScene = preload("res://Entities/Enemy/MinionOne/Cultist.tscn")
@onready var charger_scene: PackedScene = preload("res://Entities/Enemy/MinionThree/charger.tscn")
@onready var entities_container : Node2D = get_tree().get_first_node_in_group("Entities")
@export var lower_bound: Vector2
@export var upper_bound: Vector2
var num_enemy : int = 30
var current_enemies_len: int = 0

func enter(args = {}):
	if(current_enemies_len > 10):
		return
	for i in range(num_enemy):
		var position_x = randf_range(lower_bound.x, upper_bound.x)
		var position_y = randf_range(lower_bound.y, upper_bound.y)
		var chance = randf()
		if(chance < 0.8):
			spawn_enemy(cultist_scene, Vector2(position_x, position_y))
		else:
			spawn_enemy(charger_scene, Vector2(position_x, position_y))
func spawn_enemy(enemy_scene: PackedScene, enemy_position: Vector2):
	var enemy: Entity = enemy_scene.instantiate()
	enemy.position = enemy_position
	entities_container.add_child(enemy)
	current_enemies_len += 1
	enemy.die.connect(on_enemy_die)

func on_enemy_die():
	current_enemies_len -= 1

func update(delta):
	transitioned.emit(self, "idle")
