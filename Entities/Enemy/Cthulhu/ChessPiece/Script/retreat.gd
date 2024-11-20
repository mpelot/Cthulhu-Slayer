extends Agro


func _ready():
	movement_duration = 0.4
	charge_time = 0.1
	idle_time = 0.1
	animation_player.play("normal")
	retreat = true

func enter(args = {}):
	$Timer.start()




func _on_timer_timeout():
	if(randf() < 0.7):
		transitioned.emit(self, "normal")
	else:
		transitioned.emit(self, "agro")
