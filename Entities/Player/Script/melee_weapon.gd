extends Area2D

@export var player : Player

@export var player_camera: PlayerCamera


var activate: bool = true:
	set(value):
		handle_activate_state(value)
		
func handle_activate_state(state: bool):
	if(state):
		#modulate = Color.WHITE
		monitoring = true
	else:
		#modulate = Color.TRANSPARENT
		monitoring = false



func _on_body_entered(body):
	if(body is Entity):
		player_camera.shake()
		var damagable : Damagable = Damagable.new(60, player)
		body.receive_damage(damagable)
