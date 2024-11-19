extends State

@onready var timer: Timer =  $Timer
@onready var agro_sm : AgroStateMachine = $"../../../AgroStateMachine"

func enter(args = {}):
	timer.start()
	print("ENTERING REST FOR THE QUEEN")
	


func _on_timer_timeout():
	if(randf() < 0.7):
		agro_sm.set_agro_state("normal")
	else:
		agro_sm.set_agro_state("agro")
