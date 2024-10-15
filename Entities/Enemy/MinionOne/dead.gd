extends State

@onready var cultist: Cultist = $"../.."

func enter(args = {}):
	cultist.modulate = Color.BLACK;
