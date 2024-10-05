extends CharacterBody2D
class_name Cultist

@onready var state_machine: StateMachine = $StateMachine

func receive_damage(damage: Damagable):
	print("received damage")
	state_machine.transition_to_state("hurt", {"damage": damage.damage})
	
	
func _process(_delta):
	if(Input.is_action_just_pressed("Melee")):
		var damage = Damagable.new(20, self)
		receive_damage(damage)
