extends CanvasLayer

@onready var current_score = $VBoxContainer/CurrentScore/CurNum
@onready var high_score = $VBoxContainer/HighScore/HighNum

func _ready():
	if Global.floor > Global.best_floor:
		Global.best_floor = Global.floor
	current_score.text = str(Global.floor)
	high_score.text = str(Global.best_floor)

func _process(delta):
	pass

func _on_exit_main_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

func _on_retry_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/character_select.tscn")
