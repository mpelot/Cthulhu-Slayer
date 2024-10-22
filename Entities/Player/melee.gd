extends Attack

@onready var animation_player: AnimationPlayer = $AnimationPlayer


func enter(_args={}):
	# Spawn some colliding object
	print("IS IN MELEE")
	animation_player.play("melee")
	#transitioned.emit("Idle")
	
func exit():
	# Maybe despawn colliding object
	pass

#Called every frame
func update(_delta):
	pass

#Called every physic frame
func physic_update(_delta):
	pass


func _on_animation_player_animation_finished(anim_name):
	if(anim_name == "melee"):
		print("attacking finishes")
		attack_finishes.emit(self)
