class_name MainMenu
extends Control

@onready var debugButton = $CheckButton
@onready var start_buttom = $start_button as Button
@onready var quit_button = $quit_button as Button
@onready var options_button = $options_button as Button
@onready var start_level = preload("res://Scenes/tutorial.tscn") as PackedScene
@onready var buzzing = $Buzzing


func _on_check_button_toggled(toggled_on):
	Globals.debugMode = debugButton.button_pressed
	print("Debug Mode active: " + str(Globals.debugMode))

func _ready():
	handle_connecting_signals()
	if(Globals.firstStart):
		buzzing.play(0)
		Globals.firstStart = false


func handle_connecting_signals() -> void:
	start_buttom.button_down.connect(on_start_pressed)
	quit_button.button_down.connect(on_quit_pressed)


func on_start_pressed() -> void:
	get_tree().change_scene_to_packed(start_level)

func _on_options_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/settings.tscn")


func on_quit_pressed() -> void:
	get_tree().quit()


func _on_buzzing_finished():
	Globals.firstStart = false;
