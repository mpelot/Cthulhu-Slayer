#The script that will be handling the UI
#components of the player stats (health, weapon materials and so on)
extends CanvasLayer

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var health_bar : Slider = %Healthbar
var old_health_value : float = 0

func _ready():
	old_health_value = health_bar.value
	GameManager.on_health_change.connect(update_health_bar)

func update_health_bar(health):
	health_bar.value = health
	if(old_health_value - health > 0):
		animation_player.play("on_health_decrease")
	print(health)
