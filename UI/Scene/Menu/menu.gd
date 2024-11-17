extends Control

@onready var start: Button = $VBoxContainer2/Start as Button
@onready var quit: Button = $VBoxContainer2/Quit as Button
var base_game_play_path: String = "res://Scenes/Cutscenes/BeforeVillage/before_village.tscn"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	handle_connecting_signals()
	$VBoxContainer2/Start.grab_focus()


func _on_start_pressed() -> void:
	Global.goto_scene(base_game_play_path)

func _on_quit_pressed() -> void:
	get_tree().quit()

func handle_connecting_signals() -> void:
	start.button_down.connect(_on_start_pressed)
	quit.button_down.connect(_on_quit_pressed)

func _on_start_focus_entered() -> void:
	var focused_stylebox = StyleBoxFlat.new()
	focused_stylebox.content_margin_left = original_stylebox.content_margin_left + 20
	$VBoxContainer2/Start.add_theme_stylebox_override("normal", focused_stylebox)
	$"Button Hover SFX".play()
	
func _on_start_focus_exited() -> void:
	$VBoxContainer2/Start.add_theme_stylebox_override("normal", original_stylebox)
	
func _on_start_mouse_entered() -> void:
	$"Button Hover SFX".play()



func _on_diffuculty_select_focus_entered() -> void:
	var focused_stylebox = StyleBoxFlat.new()
	focused_stylebox.content_margin_left = original_stylebox.content_margin_left + 20
	$"VBoxContainer2/Diffuculty Select".add_theme_stylebox_override("normal", focused_stylebox)
	$"Button Hover SFX".play()

func _on_diffuculty_select_focus_exited() -> void:
	$"VBoxContainer2/Diffuculty Select".add_theme_stylebox_override("normal", original_stylebox)

func _on_diffuculty_select_mouse_entered() -> void:
	$"Button Hover SFX".play()


func _on_credits_focus_entered() -> void:
	var focused_stylebox = StyleBoxFlat.new()
	focused_stylebox.content_margin_left = original_stylebox.content_margin_left + 20
	$"VBoxContainer2/Credits".add_theme_stylebox_override("normal", focused_stylebox)
	$"Button Hover SFX".play()
	
func _on_credits_focus_exited() -> void:
	$"VBoxContainer2/Credits".add_theme_stylebox_override("normal", original_stylebox)
	
func _on_credits_mouse_entered() -> void:
	$"Button Hover SFX".play()


func _on_quit_focus_entered() -> void:
	var focused_stylebox = StyleBoxFlat.new()
	focused_stylebox.content_margin_left = original_stylebox.content_margin_left + 20
	$"VBoxContainer2/Quit".add_theme_stylebox_override("normal", focused_stylebox)
	$"Button Hover SFX".play()

func _on_quit_mouse_entered() -> void:
	$"VBoxContainer2/Quit".add_theme_stylebox_override("normal", original_stylebox)
	$"Button Hover SFX".play()
