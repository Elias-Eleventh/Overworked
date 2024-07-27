extends Control

@onready var current_volume = $MarginContainer/CenterContainer/VBoxContainer/HSlider/CurrentVolume
@onready var h_slider = $MarginContainer/CenterContainer/VBoxContainer/HSlider


func _ready():
	current_volume.text = str(h_slider.value)

func _on_h_slider_value_changed(value):
	AudioServer.set_bus_volume_db(0,value/2)
	current_volume.text = str(h_slider.value)

func _on_mute_toggled(toggled_on):
	AudioServer.set_bus_mute(0,toggled_on)


func _on_option_button_item_selected(index):
	match index:
		0:
			DisplayServer.window_set_size(Vector2i(1920,1080))
		1:
			DisplayServer.window_set_size(Vector2i(1600,900))
		2:
			DisplayServer.window_set_size(Vector2i(1280,720))


func _on_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/MainMenu.tscn")
