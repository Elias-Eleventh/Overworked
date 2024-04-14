extends Control
@onready var video_stream_player = $VideoStreamPlayer
@onready var button = $Button


# Called when the node enters the scene tree for the first time.
func _ready():
	button.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_video_stream_player_finished():
	button.visible = true


func _on_button_pressed():
	get_tree().change_scene_to_file("res://main.tscn")
