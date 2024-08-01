class_name MainMenu
extends Control

@onready var debugButton = $CheckButton
@onready var start_button = $start_button
@onready var options_button = $options_button
@onready var quit_button = $quit_button
@onready var start_level = preload("res://Scenes/tutorial.tscn") as PackedScene




func _on_start_pressed():
	get_tree().change_scene_to_file("res://Scenes/tutorial.tscn")


func _on_options_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/options_menu.tscn")


func _on_quit_pressed():
	get_tree().quit()


func _on_check_button_toggled(toggled_on):
	Globals.debugMode = debugButton.button_pressed
	print("Debug Mode active: " + str(Globals.debugMode))
