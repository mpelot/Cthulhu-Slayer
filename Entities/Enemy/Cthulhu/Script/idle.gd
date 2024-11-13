extends State

@onready var cthulhu: Cthulhu = $"../.."


func enter(args = {}):
	
	$Timer.start()

func _on_timer_timeout():
	transitioned.emit(self, "statedistributer")
