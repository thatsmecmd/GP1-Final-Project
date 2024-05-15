extends Node2D

@onready var closed_door = $closed_door
@onready var open_door = $open_door
@onready var enter_area = $open_door/Area2D
@onready var light: DirectionalLight2D = $DirectionalLight2D
@onready var sound: AudioStreamPlayer2D = $AudioStreamPlayer2D

func _on_key_collectible_key_collect():
	open_door.visible = true
	closed_door.visible = false
	enter_area.monitoring = true


func _on_area_2d_body_entered(body):
	print("door entered")
	sound.play()
	var tween = create_tween()
	tween.tween_property(light, "energy", 2, 0.1)
	await tween.finished
	await sound.finished
	get_tree().change_scene_to_file("res://scenes/rand_gen_floor.tscn")
	
