extends Node2D

@onready var character = Global.player_class
# Called when the node enters the scene tree for the first time.
func _ready():
	var player_scene = preload("res://scenes/player.tscn")
	if Global.player_class == "Knight":
		player_scene = preload("res://scenes/knight.tscn")
	elif Global.player_class == "Rogue":
		player_scene = preload("res://scenes/rogue.tscn")
	elif Global.player_class == "Wizzard":
		player_scene = preload("res://scenes/player.tscn")
	else:
		print("Defaulting character")
		player_scene = preload("res://scenes/player.tscn")
	print("Player Spawned?")
	var new_player = player_scene.instantiate()
	new_player.position = $".".global_position
	$".".get_parent().add_child.call_deferred(new_player)
	
	# smooth scene transitions:
	var light = $DirectionalLight2D
	print(light)
	light.visible = true
	var tween = create_tween()
	tween.tween_property(light, "energy", 0, 0.1)
	await tween.finished
	light.queue_free()
		



