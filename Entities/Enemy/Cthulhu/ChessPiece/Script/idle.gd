extends State


@onready var timer : Timer = $Timer
@onready var agro_sm : AgroStateMachine = $"../../AgroStateMachine"

func enter(args = {}):
	if(GameManager.can_pawn_move):
		timer.start()
	


func _on_timer_timeout():
	var agro_state: Agro = agro_sm.get_current_agro_state()
	if(agro_state.retreat):
		transitioned.emit(self, "retreat")
	else:
		transitioned.emit(self, "attack")
