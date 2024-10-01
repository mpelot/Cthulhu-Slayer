extends State


@onready var animation_player: AnimationPlayer = $"../../../../AnimationPlayer"

func enter(_args={}):
	# Spawn some colliding object
	print("Melee Attack")
	animation_player.play("Melee")
	transitioned.emit(self, "Idle")
	
func exit():
	# Maybe despawn colliding object
	pass

#Called every frame
func update(_delta):
	pass

#Called every physic frame
func physic_update(_delta):
	pass
