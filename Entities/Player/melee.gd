extends State


@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var player_melee: AudioStreamPlayer2D =  $"../../../../PlayerMeleeSwing"

func enter(_args={}):
	# Spawn some colliding object
	animation_player.play("melee")
	player_melee.play()
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
		transitioned.emit(self, "Idle")
