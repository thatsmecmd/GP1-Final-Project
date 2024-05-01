extends Node2D

@onready var magic_shot_scene = preload("res://scenes/attacks/magic_shot.tscn")
@onready var magic_disk_scene = preload("res://scenes/attacks/magic_disk.tscn")
@onready var tracking_arrow_scene = preload("res://scenes/attacks/tracking_arrow.tscn")
@onready var possessed_knife_scene = preload("res://scenes/attacks/possessed_knife.tscn")

var possessed_knife_count = 0
var testhp = 0
var abilities = {
	"magic_shot" : {
		"cast" : "magic_shot",
		"name" : "Magic Shot",
		"flavor" : "A simple shot of magic!"
	},
	"magic_disk" : {
		"cast" : "magic_disk",
		"name" : "Magic Disc",
		"flavor" : "Bouncy!"
	},
	"tracking_arrow" : {
		"cast" : "tracking_arrow",
		"name" : "Tracking Arrow",
		"flavor" : "Think you could get away?"
	},
	"possessed_knife" : {
		"cast" : "possessed_knife",
		"name" : "Possessed Knives",
		"flavor" : "They hunger..."
	}
}
var primary_ability = abilities["magic_shot"]["cast"]
var secondary_ability = abilities["magic_shot"]["cast"]
func primary(spawn, damage):
	call(primary_ability, spawn, damage)
func secondary(spawn,damage):
	call(secondary_ability, spawn, damage)
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
	

func magic_disk(spawn, damage):
	var new_attack = magic_disk_scene.instantiate() as RigidBody2D
	new_attack.position = spawn
	var direction = (get_global_mouse_position() - spawn).normalized()
	new_attack.position = spawn
	new_attack.damage = damage
	new_attack.apply_impulse(direction * 500)
	get_parent().add_child(new_attack)
	
func tracking_arrow(spawn, damage):
	var new_attack = tracking_arrow_scene.instantiate() as Area2D
	new_attack.direction = get_global_mouse_position() - spawn
	new_attack.damage = damage
	new_attack.position = spawn
	get_parent().add_child(new_attack)

func possessed_knife(spawn, damage):
	if possessed_knife_count < 3:
		var new_attack = possessed_knife_scene.instantiate() as Area2D
		new_attack.direction = get_global_mouse_position() - spawn
		new_attack.damage = damage
		new_attack.position = spawn
		get_parent().add_child(new_attack)
		possessed_knife_count += 1
	else:
		return
func set_primary(ability):
	primary_ability = abilities[ability]["cast"]
func set_secondary(ability):
	secondary_ability = abilities[ability]["cast"]
