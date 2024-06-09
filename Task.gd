class_name Task

extends TextureRect
## Reference to the left Key image.
@onready var key_left : TextureRect = $Key_Left
## Reference to the right Key image.
@onready var key_right : TextureRect = $Key_Right
## Reference to the progress bar.
@onready var progress_bar : ProgressBar = $ProgressBar
## Reference to the label/text of the progress bar.
@onready var label : Label = progress_bar.get_child(0)
## Reference to the Audioplayer playing at the start.
@onready var audio_start : AudioStreamPlayer2D = $AudioStart
## Reference to the Audioplayer playing in a loop.
@onready var audio_loop : AudioStreamPlayer2D = $AudioLoop
## Reference to the Timer for the Audioplayer.
@onready var audio_timer : Timer = $AudioTimer


signal gameOver
## determines if a Loop is played constantly or with a break inbetween.
@export var constantLoop = false
var newText : String = ""
## determines how much hp is lost per second.
var hps : float = 1
## Current Health.
var health : float = (randi()% 11 + (10/Globals.difficulty))
## shows if Task is currently running.
var isActive : bool


func _ready():
	isActive = false
	self.visible = false
	progress_bar.visible = false
	if (self.name == "Partner"):
		health = 10000
		progress_bar.init_health(health)
	else:
		progress_bar.init_health(health)
	key_left.visible = false
	key_right.visible = false
	
## Activates the Task and sets it to active and turns on visibility on all elements.
func activateTask():
	isActive = true
	print("Task started: " + self.name + " with " + String.num(health) + " seconds to live")
	self.visible = true
	progress_bar.visible = true
	key_left.visible = true
	key_right.visible = true
	playAudio()

func playAudio() -> void:
	audio_start.play(0.0)

func playAudioLoop() -> void:
	audio_loop.play(0.0)

func _process(delta):
	if isActive:
		progress_bar._set_health(progress_bar.health-(delta * hps))
		newText = String.num(progress_bar.health,2)
		label.text = newText

## switches to the gameover Scene when health reaches 0.
func _on_progress_bar_dead():
	isActive = false
	print("Failed task: " + self.name)
	if(!Globals.debugMode):
		get_tree().change_scene_to_file("res://Scenes/game_over!.tscn")

## starts the Audioloop.
func _on_audio_start_finished():
	playAudioLoop()
## plays the audio in a loop depending if constantLoop is set to true, else start timer.
func _on_audio_loop_finished():
	if constantLoop:
		playAudioLoop()
	else:
		audio_timer.start()
## plays the audioLoop if constantLoop is set to false.
func _on_audio_timer_timeout():
	playAudioLoop()
