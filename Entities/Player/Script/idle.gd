extends State


func enter(_args={}):
	print("I am now Idle")
	
func exit():
	pass


#Called every frame
func update(_delta):
	if Input.is_action_just_pressed("Melee"):
		transitioned.emit(self, "Melee")
	elif Input.is_action_just_pressed("Shoot"):
		transitioned.emit(self, "Ranged")

#Called every physic frame
func physic_update(_delta):
	pass
