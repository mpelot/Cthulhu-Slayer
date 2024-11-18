extends State

@onready var pawn : Pawn = $"../.."
@onready var damage_area : Area2D = $Area2D

@onready var spot_reservation_scene : PackedScene = preload("res://Scenes/Environment/BossRoom/ChessPieces/Pawn/spot_reservation.tscn")
var resevation : Area2D
var direction : Vector2 = Vector2.UP

func enter(args = {}):
	if(check_direction(direction * 128)):
		direction *= -1
	move()
	
func move():
	var target_position = pawn.position + direction * 128
	var tween = get_tree().create_tween()
	tween.tween_property(pawn, "position", target_position, 0.8)
	tween.finished.connect(handle_finished_moving)
	spawn_reservation(pawn.global_position + direction * 128)
	damage_area.monitoring = true


func spawn_reservation(pos: Vector2):
	resevation = spot_reservation_scene.instantiate()
	resevation.position = pos
	get_tree().root.add_child(resevation)


func handle_finished_moving():
	transitioned.emit(self, "idle")
	damage_area.monitoring = false
	resevation.queue_free()
	resevation = null

func check_direction(direction : Vector2):
	var space_state = get_world_2d().direct_space_state
	var query = PhysicsRayQueryParameters2D.create(global_position, direction + global_position, 3)
	query.collide_with_areas = true
	var result : Dictionary = space_state.intersect_ray(query)
	return not result.is_empty()



func _on_area_2d_body_entered(body):
	if(body is Entity):
		var damage : Damagable = Damagable.new(200, pawn)
		body.receive_damage(damage)
