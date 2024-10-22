extends Camera2D
class_name PlayerCamera

@onready var camera_player : AnimationPlayer = $CameraPlayer

func shake():
	camera_player.play("shake")
