extends CanvasLayer

func _ready():
	pass

func change_scene(callback: Callable):
	$AnimationPlayer.play("dissolve")
	await $AnimationPlayer.animation_finished
	callback.call() #Function that is suppose to transition the scene
	$AnimationPlayer.play_backwards("dissolve")
