extends State


func enter(args = {}):
	$Timer.start()

func _on_timer_timeout():
	transitioned.emit(self, "armslam")
