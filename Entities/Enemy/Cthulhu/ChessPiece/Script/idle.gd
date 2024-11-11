extends State


@onready var timer : Timer = $Timer


func enter(args = {}):
	timer.start()
	


func _on_timer_timeout():
	transitioned.emit(self, "attack")
