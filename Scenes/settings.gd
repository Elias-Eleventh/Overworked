extends Control

@onready var exit_button = $exit_button
@onready var volume = $Volume
@onready var mute = $Mute


#Return Button
func _on_exit_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/MainMenu.tscn")


#Volume_Slider
var master_bus = AudioServer.get_bus_index("Master")

func _on_volume_value_changed(value):
	AudioServer.set_bus_volume_db(master_bus, value)



#MuteButton
var previous_volume = 0


func _on_mute_toggled(toggled_on):
	if toggled_on:
		# Mute by setting volume to a very low value
		AudioServer.set_bus_volume_db(0, -80)
	else:
		# Unmute by restoring the previous volume level
		AudioServer.set_bus_volume_db(0, previous_volume)


#Resolution_Tab
func _on_resolution_item_selected(index):
	match index:
		0:
			DisplayServer.window_set_size(Vector2i(3840,2160))
		1:
			DisplayServer.window_set_size(Vector2i(3200, 1800))
		2:
			DisplayServer.window_set_size(Vector2i(2560, 1440))
		3:
			DisplayServer.window_set_size(Vector2i(2048,1152))
		4:
			DisplayServer.window_set_size(Vector2i(1920,1080))
		5:
			DisplayServer.window_set_size(Vector2i(1600,900))
		6:
			DisplayServer.window_set_size(Vector2i(1366,768))
		7:
			DisplayServer.window_set_size(Vector2i(1280, 720))
		8:
			DisplayServer.window_set_size(Vector2i(1024, 576))


func _on_fullscreen_toggled(toggled_on):
	if toggled_on:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
