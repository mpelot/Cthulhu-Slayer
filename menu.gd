extends Control

@onready var start: Button = $VBoxContainer2/Start as Button
@onready var quit: Button = $VBoxContainer2/Quit as Button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	handle_connecting_signals()
	$VBoxContainer2/Start.grab_focus()


func _on_start_pressed() -> void:
	get_tree().change_scene()

func _on_quit_pressed() -> void:
	get_tree().quit()

func handle_connecting_signals() -> void:
	start.button_down.connect(_on_start_pressed)
	quit.button_down.connect(_on_quit_pressed)
