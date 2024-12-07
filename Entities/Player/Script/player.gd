extends CharacterBody2D
class_name Player

@onready var state_machine: StateMachine = $"StateMachine (FSM)"


func receive_damage(damage: Damagable):
	var args = {"damage": damage.damage}
	state_machine.transition_to_state("hurt", args)
