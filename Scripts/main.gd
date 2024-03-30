extends Node2D

@onready var laundryhp = $"Control/VBoxContainer/1/Laundry/ProgressBar"
@onready var cookinghp = $"Control/VBoxContainer/1/Cooking/ProgressBar"
@onready var socialisinghp = $"Control/VBoxContainer/1/Socialising/ProgressBar"
@onready var shoppinghp = $"Control/VBoxContainer/2/Shopping/ProgressBar"
@onready var fitnesshp = $"Control/VBoxContainer/2/Fitness/ProgressBar"
@onready var travellhp = $"Control/VBoxContainer/3/Travell/ProgressBar"
@onready var workhp = $"Control/VBoxContainer/3/Work/ProgressBar"
@onready var childcarehp = $"Control/VBoxContainer/3/Childcare/ProgressBar"

@onready var key_q = $"Control/VBoxContainer/1/Laundry/Key_Left"
@onready var key_e = $"Control/VBoxContainer/1/Laundry/Key_Right"


@onready var tasks = [laundryhp,cookinghp,socialisinghp,shoppinghp,fitnesshp,travellhp,workhp,childcarehp]


# Called when the node enters the scene tree for the first time.
func _ready():
	for i in tasks.size():
		tasks[i].init_health(randi()% 11 + 10)
		tasks[i].timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("Q"):
		laundryhp.health += 0.2
		key_q.get_child(0).play("Keypress")
	if Input.is_action_just_pressed("E"):
		laundryhp.health += 0.2
		key_e.get_child(0).play("Keypress")
