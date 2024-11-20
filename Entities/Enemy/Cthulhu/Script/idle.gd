extends State

@onready var cthulhu: Cthulhu = $"../.."
@onready var head_player : AnimationPlayer = $"../../HeadAnimation"

func enter(args = {}):
	if(cthulhu.is_phase_2):
		head_player.play("agro")
	else:
		head_player.play("idle")
	$Timer.start()

func _on_timer_timeout():
	transitioned.emit(self, "statedistributer")
