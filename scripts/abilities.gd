extends Node2D

@onready var magic_shot_scene = preload("res://scenes/attacks/magic_shot.tscn")
@onready var magic_disk_scene = preload("res://scenes/attacks/magic_disk.tscn")
@onready var tracking_arrow_scene = preload("res://scenes/attacks/tracking_arrow.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func magic_shot(spawn, damage):
	var new_attack = magic_shot_scene.instantiate() as Area2D
	new_attack.direction = get_global_mouse_position() - spawn
	new_attack.damage = damage
	new_attack.position = spawn
	get_parent().add_child(new_attack)
	
	print("Hello from ablities")

func magic_disk(spawn, damage):
	var new_attack = magic_disk_scene.instantiate() as RigidBody2D
	new_attack.position = spawn
	var direction = (get_global_mouse_position() - spawn).normalized()
	new_attack.position = spawn
	new_attack.damage = damage
	new_attack.apply_impulse(direction * 500)
	get_parent().add_child(new_attack)
	print("Spawned disk")
func tracking_arrow(spawn, damage):
	var new_attack = tracking_arrow_scene.instantiate() as Area2D
	new_attack.direction = get_global_mouse_position() - spawn
	new_attack.damage = damage
	new_attack.position = spawn
	get_parent().add_child(new_attack)
	
