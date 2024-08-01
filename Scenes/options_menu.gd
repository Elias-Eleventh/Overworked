extends Control

@onready var button = $MarginContainer/VBoxContainer/Button


func _on_return_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/MainMenu.tscn")
