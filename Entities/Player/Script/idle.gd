extends State


func enter(_args={}):
	pass
	
func exit():
	pass


#Called every frame
func update(_delta):
	if (Input.is_action_just_pressed("Melee")):
		transitioned.emit(self, "Melee")
	pass

#Called every physic frame
func physic_update(_delta):
	pass
