extends State


@onready var timer : Timer = $Timer
@onready var agro_sm : AgroStateMachine = $"../../AgroStateMachine"


func enter(args = {}):
	set_agro_properties()
	if(GameManager.can_pawn_move):
		timer.start()
	
func set_agro_properties():
	var agro : Agro = agro_sm.get_current_agro_state()
	$Timer.wait_time = agro.idle_time
	$"../Attack/Move".move_duration = agro.movement_duration
	$"../Attack/ChargingUp/Timer".wait_time = agro.charge_time

func _on_timer_timeout():
	var agro_state: Agro = agro_sm.get_current_agro_state()
	if(agro_state.retreat):
		transitioned.emit(self, "retreat")
	else:
		transitioned.emit(self, "attack")
