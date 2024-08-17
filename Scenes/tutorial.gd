extends Control

@onready var video_stream_player = $VideoStreamPlayer

func _ready():
	AudioPlayer.stop_music()

func _on_video_stream_player_finished():
	get_tree().change_scene_to_file("res://main.tscn")
