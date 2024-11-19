extends StateMachine
class_name AgroStateMachine

func get_current_agro_state() -> Agro:
	return current_state

func set_agro_state(agro_state: String):
	transition_to_state(agro_state)
