extends Node

var floor = "res://scenes/floor_1.tscn"

func _ready():
	var rand = randi_range(1, 4)
	if rand == 1:
		print("floor 1")
		floor = "res://scenes/floor_1.tscn"
	elif rand == 2:
		print("floor 2")
		floor = "res://scenes/floor_2.tscn"
	elif rand == 3:
		print("floor 3")
		floor = "res://scenes/floor_3.tscn"
	elif rand == 4:
		print("floor 4")
		floor = "res://scenes/floor_2.tscn"
	Global.floor += 1
func _process(delta):
	get_tree().change_scene_to_file(floor)
	
