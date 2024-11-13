extends Attack

@onready var pivot: Pivot = $"../../../Weapon/Pivot"
@onready var main_body_sprite: Node2D = $"../../../Sprite"
var input_buffering_counter: float = 0.4
var input_buffering_time: float = 0.1

func _ready():
	pivot.attack_finished.connect(attack_finished)

	

func enter(_args={}):
	# Spawn some colliding object
	input_buffering_counter = input_buffering_time

	pivot.attack()
	main_body_sprite.visible = false
	#transitioned.emit("Idle")
	
func exit():
	# Maybe despawn colliding object
	main_body_sprite.visible = true

#Called every frame
func update(_delta):
	input_buffering_counter -= _delta
	if(input_buffering_counter < 0):
		if(Input.is_action_just_pressed("Melee")):
			enter({})
	

#Called every physic frame
func physic_update(_delta):
	pass

func attack_finished():
	attack_finishes.emit(self)

func _on_animation_player_animation_finished(anim_name):
	if(anim_name == "melee"):
		pass
		
