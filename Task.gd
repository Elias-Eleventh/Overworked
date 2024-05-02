extends TextureRect

@onready var key_left = $Key_Left
@onready var key_right = $Key_Right
@onready var progress_bar = $ProgressBar
@onready var label = progress_bar.get_child(0)


signal gameOver

var newText = ""
var hps = 1
var health = (randi()% 11 + (10/Globals.difficulty))
var isActive 
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
	
func activateTask():
	isActive = true
	print("Task started: " + self.name + " with " + String.num(health) + " seconds to live")
	self.visible = true
	progress_bar.visible = true
	key_left.visible = true
	key_right.visible = true


func _process(delta):
	if isActive:
		progress_bar._set_health(progress_bar.health-(delta * hps))
		newText = String.num(progress_bar.health,2)
		label.text = newText

func _on_progress_bar_dead():
	isActive = false
	print("Failed task: " + self.name)
	if(!Globals.debugMode):
		get_tree().change_scene_to_file("res://Scenes/game_over!.tscn")
