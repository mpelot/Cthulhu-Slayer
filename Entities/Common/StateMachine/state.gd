extends Node2D
class_name State

signal transitioned(state: State, next_state: String)

func enter(_args={}):
	pass
	
func exit():
	pass


#Called every frame
func update(_delta):
	pass

#Called every physic frame
func physic_update(_delta):
	pass
