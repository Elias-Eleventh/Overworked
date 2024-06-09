extends Node2D

#Lebensbalken
@onready var laundryhp = $"Control/VBoxContainer/1/Laundry/ProgressBar"
@onready var cookinghp = $"Control/VBoxContainer/1/Cooking/ProgressBar"
@onready var mophp = $"Control/VBoxContainer/1/Mop/ProgressBar"
@onready var babyhp = $"Control/VBoxContainer/2/baby/ProgressBar"
@onready var partnerhp = $"Control/VBoxContainer/2/Partner/ProgressBar"
@onready var fitnesshp = $"Control/VBoxContainer/2/Fitness/ProgressBar"
@onready var shoppinghp = $"Control/VBoxContainer/3/Shopping/ProgressBar"
@onready var metrohp = $"Control/VBoxContainer/3/Metro/ProgressBar"
@onready var officehp = $"Control/VBoxContainer/3/Office/ProgressBar"

#Tasks
@onready var laundry = $"Control/VBoxContainer/1/Laundry"
@onready var cooking = $"Control/VBoxContainer/1/Cooking"
@onready var mop = $"Control/VBoxContainer/1/Mop"
@onready var baby = $"Control/VBoxContainer/2/baby"
@onready var partner = $"Control/VBoxContainer/2/Partner"
@onready var fitness = $"Control/VBoxContainer/2/Fitness"
@onready var shopping = $"Control/VBoxContainer/3/Shopping"
@onready var metro = $"Control/VBoxContainer/3/Metro"
@onready var office = $"Control/VBoxContainer/3/Office"


#Keys
@onready var key_q = $"Control/VBoxContainer/1/Laundry/Key_Left"
@onready var key_e = $"Control/VBoxContainer/1/Laundry/Key_Right"
@onready var key_u = $"Control/VBoxContainer/1/Cooking/Key_Left"
@onready var key_p = $"Control/VBoxContainer/1/Cooking/Key_Right"
@onready var key_7 = $"Control/VBoxContainer/1/Mop/Key_Left"
@onready var key_9 = $"Control/VBoxContainer/1/Mop/Key_Right"
@onready var key_a = $"Control/VBoxContainer/2/baby/Key_Left"
@onready var key_d = $"Control/VBoxContainer/2/baby/Key_Right"
@onready var key_enter = $"Control/VBoxContainer/2/Fitness/Key_Left"
@onready var key_backspace = $"Control/VBoxContainer/2/Fitness/Key_Right"
@onready var key_ctrl = $"Control/VBoxContainer/3/Shopping/Key_Left"
@onready var key_space = $"Control/VBoxContainer/3/Shopping/Key_Right"
@onready var key_h = $"Control/VBoxContainer/3/Metro/Key_Left"
@onready var key_k = $"Control/VBoxContainer/3/Metro/Key_Right"
@onready var key_1 = $"Control/VBoxContainer/3/Office/Key_Left"
@onready var key_3 = $"Control/VBoxContainer/3/Office/Key_Right"

@onready var timer_label = $ColorRect/TimerLabel
@onready var game_win_timer = $GameWinTimer

@onready var dummy = $"Control/VBoxContainer/2/dummy"


@onready var tasksPB = [laundryhp,cookinghp,mophp,babyhp,fitnesshp,shoppinghp,metrohp,officehp,partnerhp]
@onready var tasks = [laundry,cooking,mop,baby,fitness,shopping,metro,office,partner]
var currentDifficulty = 1
@onready var increase_difficulty = $IncreaseDifficulty
@onready var start_game = $StartGame


# Called when the node enters the scene tree for the first time.
func _ready():
	if(Globals.debugMode):
		increase_difficulty.wait_time = 1
		game_win_timer.wait_time = 15
	else:
		increase_difficulty.wait_time = 5*(1/Globals.difficulty)
		game_win_timer.wait_time = Globals.timeToWin

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#Top Left Task:
	if Input.is_action_just_pressed("Q"):
		laundryhp.health += 0.2
		key_q.get_child(0).play("Keypress")
	if Input.is_action_just_pressed("E"):
		laundryhp.health += 0.2
		key_e.get_child(0).play("Keypress")
	#Top Middle Task:
	if Input.is_action_just_pressed("U"):
		cookinghp.health += 0.2
		key_u.get_child(0).play("Keypress")
	if Input.is_action_just_pressed("P"):
		cookinghp.health += 0.2
		key_p.get_child(0).play("Keypress")
	#Top Right Task:
	if Input.is_action_just_pressed("7"):
		mophp.health += 0.2
		key_7.get_child(0).play("Keypress")
	if Input.is_action_just_pressed("9"):
		mophp.health += 0.2
		key_9.get_child(0).play("Keypress")
	#Middle Left Task:
	if Input.is_action_just_pressed("A"):
		babyhp.health += 0.2
		key_a.get_child(0).play("Keypress")
	if Input.is_action_just_pressed("D"):
		babyhp.health += 0.2
		key_d.get_child(0).play("Keypress")
	#Middle Right Task:
	if Input.is_action_just_pressed("ENTER"):
		fitnesshp.health += 0.2
		key_enter.get_child(0).play("Keypress")
	if Input.is_action_just_pressed("BACKSPACE"):
		fitnesshp.health += 0.2
		key_backspace.get_child(0).play("Keypress")
	#Bottom Left Task:
	if Input.is_action_just_pressed("L_CTRL"):
		shoppinghp.health += 0.2
		key_ctrl.get_child(0).play("Keypress")
	if Input.is_action_just_pressed("SPACEBAR"):
		shoppinghp.health += 0.2
		key_space.get_child(0).play("Keypress")
	#Bottom Middle Task:
	if Input.is_action_just_pressed("H"):
		metrohp.health += 0.2
		key_h.get_child(0).play("Keypress")
	if Input.is_action_just_pressed("K"):
		metrohp.health += 0.2
		key_k.get_child(0).play("Keypress")	
	#Bottom Right Task:
	if Input.is_action_just_pressed("1"):
		officehp.health += 0.2
		key_1.get_child(0).play("Keypress")
	if Input.is_action_just_pressed("3"):
		officehp.health += 0.2
		key_3.get_child(0).play("Keypress")
		
	if (partner.isActive):
		dummy.visible = false
		partner.progress_bar.visible = false
		partner.key_left.visible = false
		partner.key_right.visible = false
		
	_set_timer_text()

func increaseDifficulty():
	if currentDifficulty < tasksPB.size():
		tasks[currentDifficulty].activateTask()
		currentDifficulty += 1

func _input(event):
	if Input.is_action_pressed("QuitGame"):
		get_tree().quit()

func _on_increase_difficulty_timeout():
	if currentDifficulty < tasksPB.size():
		increaseDifficulty()

func _on_start_game_timeout():
	tasks[0].isActive = true
	tasks[0].activateTask()
	game_win_timer.start()
	increase_difficulty.start()

func _set_timer_text():
	timer_label.text = String.num(game_win_timer.time_left,0)

func _on_game_win_timer_timeout():
	get_tree().change_scene_to_file("res://Scenes/you_won.tscn")
	print("YOU HAVE WON THE GAME!")
