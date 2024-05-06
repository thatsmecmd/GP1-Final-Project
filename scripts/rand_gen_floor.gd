extends Node

func _ready():
	var floor = "res://scenes/default_room.tscn"
	var rand = randi_range(1, 4)
	if rand == 1:
		print("floor 1")
	elif rand == 2:
		print("floor 2")
	elif rand == 3:
		print("floor 3")
	elif rand == 4:
		print("floor 4")
	# change this later, add more file paths to the floors
	# can be more than 4, minimum is 4
	get_tree().change_scene_to_file(floor)
