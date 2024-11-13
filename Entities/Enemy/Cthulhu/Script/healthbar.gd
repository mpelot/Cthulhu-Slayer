extends CanvasLayer
class_name CthulhuHealthBar

@onready var health_bar : Slider = %HealthBar

func handle_health_change(value):
	health_bar.value = value
