extends Entity
class_name Cultist

@onready var state_machine: StateMachine = $StateMachine
var health: float = 100

func receive_damage(damage: Damagable):
	if(damage.from is Player):
		$"Cultist hurt sfx".play()
		health -= damage.damage
		if(health < 0):
			state_machine.transition_to_state("dead")
			return
		state_machine.transition_to_state("hurt", {"damage": damage})
	if(damage.from is Pawn):
		state_machine.transition_to_state("dead")

	
func _process(_delta):
	pass
