#The script that will be handling the UI
#components of the player stats (health, weapon materials and so on)
extends CanvasLayer

@onready var health_bar : Slider = %Healthbar

func _ready():
	GameManager.on_health_change.connect(update_health_bar)

func update_health_bar(health):
	health_bar.value = health
	print(health)
