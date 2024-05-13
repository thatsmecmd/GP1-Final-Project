extends Node2D

#Scene preloader
@onready var magic_shot_scene = preload("res://scenes/attacks/magic_shot.tscn")
@onready var magic_disk_scene = preload("res://scenes/attacks/magic_disk.tscn")
@onready var tracking_arrow_scene = preload("res://scenes/attacks/tracking_arrow.tscn")
@onready var possessed_knife_scene = preload("res://scenes/attacks/possessed_knife.tscn")
@onready var overhead_strike_scene = preload("res://scenes/attacks/overhead_strike.tscn")
@onready var flurry_of_blades_scene = preload("res://scenes/attacks/flurry_of_blades.tscn")
@onready var fallen_star_scene = preload("res://scenes/attacks/fallen_star.tscn")
#Cast conditionals
var direction_flip = false
var can_overhead_strike = true
var can_flurry_of_blades = true
var can_ranged_attack = true
var can_ranged_attack_secondary = true
var possessed_knife_count = 0
#var testhp = 0

#Melee relitive position
var player = "NONE"

#Grand ability db
var abilities = {
	"magic_shot" : {
		"cast" : "magic_shot",
		"name" : "Magic Shot",
		"flavor" : "A simple shot of magic!",
		"type" : "ranged",
		"sprite" : "res://assets/Kyrise's 16x16 RPG Icon Pack - V1.3/icons/16x16/book_01b.png",
		"action" : "primary",
		"cooldown": 1,
		"sfx" : "res://assets/audio/attacks/shot2.wav"
	},
	"magic_disk" : {
		"cast" : "magic_disk",
		"name" : "Magic Disc",
		"flavor" : "Bouncy!",
		"type" : "ranged",
		"sprite": "res://assets/Kyrise's 16x16 RPG Icon Pack - V1.3/icons/16x16/book_01c.png",
		"action": "secondary",
		"cooldown" : 1,
		"sfx" : "res://assets/audio/attacks/shot2.wav"
	},
	"tracking_arrow" : {
		"cast" : "tracking_arrow",
		"name" : "Tracking Arrow",
		"flavor" : "Think you could get away?",
		"type" : "ranged",
		"sprite": "res://assets/Kyrise's 16x16 RPG Icon Pack - V1.3/icons/16x16/book_01d.png",
		"action": "primary",
		"cooldown" : 0.7,
		"sfx" : "res://assets/audio/Free Fantasy SFX Pack By TomMusic/WAV Files/SFX/Attacks/Bow Attacks Hits and Blocks/Bow Attack 1.wav"
	},
	"possessed_knife" : {
		"cast" : "possessed_knife",
		"name" : "Possessed Knives",
		"flavor" : "They hunger...",
		"type" : "ranged",
		"sprite" : "res://assets/Kyrise's 16x16 RPG Icon Pack - V1.3/icons/16x16/sword_03e.png",
		"action": "secondary",
		"cooldown" : 0,
		"sfx" : "res://assets/audio/attacks/nothing.wav"
	},
	"overhead_strike":{
		"cast" : "overhead_strike",
		"name" : "Overhead Strike",
		"flavor" : "PLACEHOLDER",
		"type" : "melee",
		"sprite" : "res://assets/Kyrise's 16x16 RPG Icon Pack - V1.3/icons/16x16/book_03a.png",
		"action" : "primary",
		"cooldown" : 0,
		"sfx" : "res://assets/audio/Free Fantasy SFX Pack By TomMusic/WAV Files/SFX/Attacks/Sword Attacks Hits and Blocks/Sword Attack 2.wav"
	},
	"flurry_of_blades":{
		"cast" : "flurry_of_blades",
		"name" : "Flurry Of Blades",
		"flavor" : "Death by a thousand cuts",
		"type" : "melee",
		"sprite" : "res://assets/Kyrise's 16x16 RPG Icon Pack - V1.3/icons/16x16/book_03b.png",
		"action" : "secondary",
		"cooldown" : 0,
		"sfx" : "res://assets/audio/Free Fantasy SFX Pack By TomMusic/WAV Files/SFX/Attacks/Sword Attacks Hits and Blocks/Sword Attack 2.wav"
	},
	"fallen_stars":{
		"cast" : "fallen_stars",
		"name" : "Fallen Stars",
		"flavor" : "PLACEHOLDER",
		"type" : "ranged",
		"sprite": "res://assets/Kyrise's 16x16 RPG Icon Pack - V1.3/icons/16x16/book_01e.png",
		"action": "primary",
		"cooldown" : 1,
		"sfx" : "res://assets/audio/attacks/shot2.wav"
	}
}

#Holds primary and secondary attack
var primary_ability = abilities["magic_shot"]
var secondary_ability = abilities["magic_shot"]

#Ability call functions
func primary(spawn, damage):
	if primary_ability["type"] == "ranged":
		if can_ranged_attack:
			call(primary_ability["cast"], spawn, damage)
		else:
			print("primary on Cooldown")
	else:
		call(primary_ability["cast"], spawn, damage)
func secondary(spawn,damage):
	if secondary_ability["type"] == "ranged":
		if can_ranged_attack_secondary:
			call(secondary_ability["cast"], spawn, damage)
		else:
			print("Secondary on cooldown")
	else:
		call(secondary_ability["cast"], spawn, damage)
#Ability spawners
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
func overhead_strike(spawn, damage):
	if can_overhead_strike:
		var new_attack = overhead_strike_scene.instantiate() as Area2D
		new_attack.damage = damage
		if direction_flip == true:
			var sprite = new_attack.get_node("Sprite") as AnimatedSprite2D
			sprite.flip_h = true
		new_attack.position = spawn
		player.add_child(new_attack)
func flurry_of_blades(spawn, damage):
	if can_flurry_of_blades:
		var new_attack = flurry_of_blades_scene.instantiate() as Area2D
		new_attack.damage = damage
		if direction_flip == true:
			var sprite = new_attack.get_node("Sprite") as AnimatedSprite2D
			sprite.flip_h = true
		new_attack.position = spawn
		player.add_child(new_attack)
func fallen_stars(_spawn, damage):
	var new_attack1 = fallen_star_scene.instantiate() as Area2D
	var new_attack2 = fallen_star_scene.instantiate() as Area2D
	var new_attack3 = fallen_star_scene.instantiate() as Area2D
	
	var starspawn1 = (get_global_mouse_position() + Vector2(0,-1000))
	var starspawn2 = starspawn1 + Vector2(300,0)
	var starspawn3 = starspawn1 - Vector2(300,0)

	new_attack1.damage = damage
	new_attack2.damage = damage
	new_attack3.damage = damage
	
	new_attack1.position = starspawn1
	new_attack2.position = starspawn2
	new_attack3.position = starspawn3
	
	new_attack1.direction = get_global_mouse_position() - starspawn1
	new_attack2.direction = get_global_mouse_position() - starspawn2
	new_attack3.direction = get_global_mouse_position() - starspawn3
	get_parent().add_child(new_attack1)
	get_parent().add_child(new_attack2)
	get_parent().add_child(new_attack3)
	
	
#Setters for abilities
func set_primary(ability):
	primary_ability = abilities[ability]
func set_secondary(ability):
	secondary_ability = abilities[ability]
