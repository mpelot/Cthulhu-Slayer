extends CanvasLayer

@onready var resume: Button = $Pause/CenterContainer/PanelContainer/MarginContainer/VBoxContainer/Resume
@onready var pause: CanvasLayer = $"."
var menu_path: String = "res://UI/Scene/Menu/menu.tscn"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("Pause"):
		pause.visible = true
		get_tree().paused = true
		resume.grab_focus()


func _on_resume_pressed() -> void:
	$"Pause/Button Press".play()
	pause.visible = false
	get_tree().paused = false
	
func _on_resume_focus_entered() -> void:
	pass # Replace with function body.


func _on_to_main_menu_pressed() -> void:
	$"Pause/Button Press".play()
	Global.goto_scene(menu_path)
	get_tree().paused = false
	pause.visible = false
	
	
func _on_quit_pressed() -> void:
	get_tree().quit()
	
