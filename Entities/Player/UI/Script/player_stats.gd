#The script that will be handling the UI
#components of the player stats (health, weapon materials and so on)
extends CanvasLayer
class_name PlayerStats


@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var health_bar : Slider = %Healthbar
@onready var stamina_bar : Slider = %StaminaBar
var old_health_value : float = 0

func _ready():
	old_health_value = health_bar.value
	health_bar.value = GameManager.health
	GameManager.on_health_change.connect(update_health_bar)

func update_health_bar(health):
	health_bar.value = health
	if(old_health_value - health > 0):
		animation_player.play("on_health_decrease")

func update_stamina_bar(stamina):
	stamina_bar.value = stamina
