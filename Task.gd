extends TextureRect

@onready var key_left = $Key_Left
@onready var key_right = $Key_Right
@onready var progress_bar = $ProgressBar
@onready var label = progress_bar.get_child(0)

var newText = ""
var hps = 1
var health = (randi()% 11 + 10)
var isActive 
func _ready():
	isActive = false
	progress_bar.visible = false
	progress_bar.init_health(health)
	key_left.visible = false
	key_right.visible = false
	
func activateTask():
	isActive = true
	progress_bar.visible = true
	key_left.visible = true
	key_right.visible = true


func _process(delta):
	if isActive:
		progress_bar._set_health(progress_bar.health-(delta * hps))
		newText = String(progress_bar.health)
		label.text = newText
