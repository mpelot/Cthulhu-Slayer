#Calling all of its behaviors per frame
extends State
class_name BehaviorMachine

var is_in_state_machine: bool = false
var behaviors : Array[Behavior]

func _ready():
	for child in get_children():
		if(child is Behavior):
			behaviors.append(child)
	if(get_parent() is StateMachine):
		is_in_state_machine = true
		enter()
	

func enter(_args = {}):
	for behavior in behaviors:
		behavior.enter()
	

func _process(delta):
	if(not is_in_state_machine):
		update(delta)
		physic_update(delta)


func update(delta):
	for behavior in behaviors:
		behavior.update(delta)

func physic_update(delta):
	for behavior in behaviors:
		behavior.physic_update(delta)
