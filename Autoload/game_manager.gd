#The game manager is responsible with managing global variables and functions that we will need 
#to propagate through different scene. 
extends Node

signal on_health_change(health: float)
var health: float = 100 :
	get:
		return health
	set(value):
		on_health_change.emit(value)
		if(value >= 100):
			on_health_full()
		elif(value <= 0):
			on_health_empty()
		health = clamp(value, 0, 100)


func on_health_full():
	pass
	
func on_health_empty():
	pass
