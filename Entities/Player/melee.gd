extends State


@onready var animation_player: AnimationPlayer = $"../../../../AnimationPlayer"

func enter(_args={}):
	# Spawn some colliding object
	animation_player.play("Melee")
	transitioned.emit("Idle")
	
func exit():
	pass

#Called every frame
func update(_delta):
	pass

#Called every physic frame
func physic_update(_delta):
	pass
