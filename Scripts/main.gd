extends Node2D

#Lebensbalken
@onready var laundryhp = $"Control/VBoxContainer/1/Laundry/ProgressBar"
@onready var cookinghp = $"Control/VBoxContainer/1/Cooking/ProgressBar"
@onready var socialisinghp = $"Control/VBoxContainer/1/Socialising/ProgressBar"
@onready var shoppinghp = $"Control/VBoxContainer/2/Shopping/ProgressBar"
@onready var fitnesshp = $"Control/VBoxContainer/2/Fitness/ProgressBar"
@onready var travellhp = $"Control/VBoxContainer/3/Travell/ProgressBar"
@onready var workhp = $"Control/VBoxContainer/3/Work/ProgressBar"
@onready var childcarehp = $"Control/VBoxContainer/3/Childcare/ProgressBar"

#Tasks
@onready var laundry = $"Control/VBoxContainer/1/Laundry"
@onready var cooking = $"Control/VBoxContainer/1/Cooking"
@onready var socialising = $"Control/VBoxContainer/1/Socialising"
@onready var shopping = $"Control/VBoxContainer/2/Shopping"
@onready var partner = $"Control/VBoxContainer/2/Partner"
@onready var fitness = $"Control/VBoxContainer/2/Fitness"
@onready var travell = $"Control/VBoxContainer/3/Travell"
@onready var work = $"Control/VBoxContainer/3/Work"
@onready var childcare = $"Control/VBoxContainer/3/Childcare"


#Keys
@onready var key_q = $"Control/VBoxContainer/1/Laundry/Key_Left"
@onready var key_e = $"Control/VBoxContainer/1/Laundry/Key_Right"
@onready var key_u = $"Control/VBoxContainer/1/Cooking/Key_Left"
@onready var key_p = $"Control/VBoxContainer/1/Cooking/Key_Right"
@onready var key_7 = $"Control/VBoxContainer/1/Socialising/Key_Left"
@onready var key_9 = $"Control/VBoxContainer/1/Socialising/Key_Right"
@onready var key_a = $"Control/VBoxContainer/2/Shopping/Key_Left"
@onready var key_d = $"Control/VBoxContainer/2/Shopping/Key_Right"
@onready var key_enter = $"Control/VBoxContainer/2/Fitness/Key_Left"
@onready var key_backspace = $"Control/VBoxContainer/2/Fitness/Key_Right"
@onready var key_ctrl = $"Control/VBoxContainer/3/Travell/Key_Left"
@onready var key_space = $"Control/VBoxContainer/3/Travell/Key_Right"
@onready var key_h = $"Control/VBoxContainer/3/Work/Key_Left"
@onready var key_k = $"Control/VBoxContainer/3/Work/Key_Right"
@onready var key_1 = $"Control/VBoxContainer/3/Childcare/Key_Left"
@onready var key_3 = $"Control/VBoxContainer/3/Childcare/Key_Right"






@onready var tasksPB = [laundryhp,cookinghp,socialisinghp,shoppinghp,fitnesshp,travellhp,workhp,childcarehp]
@onready var tasks = [laundry,cooking,socialising,shopping,fitness,travell,work,childcare]
var currentDifficulty = 1
@onready var increase_difficulty = $IncreaseDifficulty

# Called when the node enters the scene tree for the first time.
func _ready():
	
	tasks[0].isActive = true
	tasks[0].activateTask()
	increase_difficulty.start()

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
		socialisinghp.health += 0.2
		key_7.get_child(0).play("Keypress")
	if Input.is_action_just_pressed("9"):
		socialisinghp.health += 0.2
		key_9.get_child(0).play("Keypress")
	#Middle Left Task:
	if Input.is_action_just_pressed("A"):
		shoppinghp.health += 0.2
		key_a.get_child(0).play("Keypress")
	if Input.is_action_just_pressed("D"):
		shoppinghp.health += 0.2
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
		travellhp.health += 0.2
		key_ctrl.get_child(0).play("Keypress")
	if Input.is_action_just_pressed("SPACEBAR"):
		travellhp.health += 0.2
		key_space.get_child(0).play("Keypress")
	#Bottom Middle Task:
	if Input.is_action_just_pressed("H"):
		workhp.health += 0.2
		key_h.get_child(0).play("Keypress")
	if Input.is_action_just_pressed("K"):
		workhp.health += 0.2
		key_k.get_child(0).play("Keypress")	
	#Bottom Right Task:
	if Input.is_action_just_pressed("1"):
		childcarehp.health += 0.2
		key_1.get_child(0).play("Keypress")
	if Input.is_action_just_pressed("3"):
		childcarehp.health += 0.2
		key_3.get_child(0).play("Keypress")

func increaseDifficulty():
	if currentDifficulty < tasksPB.size():
		tasks[currentDifficulty].activateTask()
		currentDifficulty += 1

func _input(event):
	if Input.is_action_pressed("ui_cancel"):
		get_tree().quit()

func _on_increase_difficulty_timeout():
	if currentDifficulty < tasksPB.size():
		increaseDifficulty()


