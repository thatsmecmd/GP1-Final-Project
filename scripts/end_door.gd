extends Node2D

@onready var closed_door = $closed_door
@onready var open_door = $open_door
@onready var enter_area = $open_door/Area2D

func _on_key_collectible_key_collect():
	open_door.visible = true
	closed_door.visible = false
	enter_area.monitoring = true


func _on_area_2d_body_entered(body):
	print("door entered")
	get_tree().change_scene_to_file("res://scenes/default_room.tscn")
