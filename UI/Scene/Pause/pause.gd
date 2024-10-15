extends Control

@onready var pause: Control = $"."
var menu_path: String = "res://UI/Scene/Menu/menu.tscn"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

	if Input.is_action_pressed("Pause"):
		pause.visible = true
		get_tree().paused = true


func _on_resume_pressed() -> void:
	pause.visible = false
	get_tree().paused = false


func _on_to_main_menu_pressed() -> void:
	pause.visible = false
	Global.goto_scene(menu_path)


func _on_quit_pressed() -> void:
	get_tree().quit()
