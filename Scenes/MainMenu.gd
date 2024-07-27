extends Control

@onready var debugButton = $CheckButton

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_start_pressed():
	get_tree().change_scene_to_file("res://Scenes/tutorial.tscn")


func _on_quit_pressed():
	get_tree().quit()


func _on_check_button_toggled(toggled_on):
	Globals.debugMode = debugButton.button_pressed
	print("Debug Mode active: " + str(Globals.debugMode))


func _on_options_pressed():
	get_tree().change_scene_to_file("res://Scenes/options.tscn")
