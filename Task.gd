extends TextureRect

@onready var key_left = $Key_Left
@onready var key_right = $Key_Right
@onready var progress_bar = $ProgressBar


var health
var isActive 
func _ready():
	isActive = false
	progress_bar.visible = false
	key_left.visible = false
	key_right.visible = false
	
func activateTask():
	isActive = true
	progress_bar.visible = true
	key_left.visible = true
	key_right.visible = true
