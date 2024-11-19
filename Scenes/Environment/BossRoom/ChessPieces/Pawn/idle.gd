extends State


@onready var timer : Timer = $Timer
var is_disabled: bool = false

func enter(args = {}):
	if(GameManager.can_pawn_move):
		timer.start()
	else:
		is_disabled = true

func update(delta):
	if(not is_disabled):
		return
	if(GameManager.can_pawn_move):
		timer.start()

func _on_timer_timeout():
	transitioned.emit(self, "move")
