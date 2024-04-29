extends Node2D

@onready var enemy = $"../Follower"


func _physics_process(delta):
	position = get_viewport().get_mouse_position()
	if(Input.is_action_just_pressed("ui_accept")):
		enemy.take_damage(25)
