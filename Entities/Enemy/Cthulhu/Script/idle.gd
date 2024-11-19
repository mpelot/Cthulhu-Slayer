extends State

@onready var cthulhu: Cthulhu = $"../.."
@onready var head_player : AnimationPlayer = $"../../HeadAnimation"

func enter(args = {}):
	head_player.play("idle")
	$Timer.start()

func _on_timer_timeout():
	transitioned.emit(self, "statedistributer")
