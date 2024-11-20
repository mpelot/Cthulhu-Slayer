extends Attack

@onready var pivot: Pivot = $"../../../Weapon/Pivot"
@onready var main_body_sprite: Node2D = $"../../../Sprite"
@onready var player_melee_swing_sfx: AudioStreamPlayer2D = $"../Player melee swing SFX"

func _ready():
	pivot.attack_finished.connect(attack_finished)
	

func enter(_args={}):
	# Spawn some colliding object
	print("IS IN MELEE")
	pivot.attack()
	player_melee_swing_sfx.play()
	main_body_sprite.visible = false
	#transitioned.emit("Idle")
	
func exit():
	# Maybe despawn colliding object
	main_body_sprite.visible = true

#Called every frame
func update(_delta):
	pass

#Called every physic frame
func physic_update(_delta):
	pass

func attack_finished():
	attack_finishes.emit(self)

func _on_animation_player_animation_finished(anim_name):
	if(anim_name == "melee"):
		print("attacking finishes")
		
