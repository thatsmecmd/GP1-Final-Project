extends Node2D

@onready var character = Global.player_class
# Called when the node enters the scene tree for the first time.
func _ready():
	var player_scene = preload("res://scenes/player.tscn")
	if Global.player_class == "Knight":
		player_scene = preload("res://scenes/player.tscn")
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
		



