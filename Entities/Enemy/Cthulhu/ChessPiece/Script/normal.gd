extends Agro

func _ready():
	movement_duration = 0.8
	charge_time = 0.2
	idle_time = 0.1


func enter(args = {}):
	animation_player.play("normal")
	
