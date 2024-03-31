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


@onready var tasksPB = [laundryhp,cookinghp,socialisinghp,shoppinghp,fitnesshp,travellhp,workhp,childcarehp]
@onready var tasks = [laundry,cooking,socialising,shopping,fitness,travell,work,childcare]
var currentDifficulty = 1
@onready var increase_difficulty = $IncreaseDifficulty

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in tasksPB.size():
		tasksPB[i].init_health(randi()% 11 + 10)
	
	tasksPB[0].timer.start()
	tasks[0].isActive = true
	tasks[0].activateTask()
	increase_difficulty.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("Q"):
		laundryhp.health += 0.2
		key_q.get_child(0).play("Keypress")
	if Input.is_action_just_pressed("E"):
		laundryhp.health += 0.2
		key_e.get_child(0).play("Keypress")

func increaseDifficulty():
	if currentDifficulty < tasksPB.size():
		tasksPB[currentDifficulty].timer.start()
		tasks[currentDifficulty].activateTask()
		currentDifficulty += 1


func _on_increase_difficulty_timeout():
	if currentDifficulty < tasksPB.size():
		increaseDifficulty()
