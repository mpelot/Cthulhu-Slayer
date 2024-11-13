extends State

var next_state: String = ""
var states = ["armslam", "armslam", "armslam", "laserbeam", "summon"]


func enter(args = {}):
	next_state = states.pick_random()

func update(delta):
	transitioned.emit(self, next_state)
