extends CharacterBody2D


@onready var player_sprite = $playerSprite
@onready var hands = $hands
@onready var player = $"." as CharacterBody2D
@onready var animations = $Animations as AnimationPlayer


@export var speed = 250
@export var acceleration = 10
var spawn_point = 0
@onready var meele_spawn = $MeleeRight
@onready var stats =  $StatSystem

signal player_hit
signal player_dead
signal player_healed

var dead = false

var input: Vector2
func _ready():
	stats.max_health = Global.max_health
	stats.reset_health()
	stats.attack = Global.attack
	stats.defense = Global.defense
	stats.dodge = Global.dodge
	stats.current_health = Global.current_health
	print(stats.max_health)
	Abilities.player = $"."
	
func get_input():
	input.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	input.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	return input.normalized()
func _process(delta):
	save_stats()
func _physics_process(delta):
	#print("Current hp: ", Global.current_health)
	#print("Max hp: ", Global.max_health)
	spawn_point = $ProjectileSpawner.global_position

	animate()
	primary_attack()
	secondary_attack()
	flip()
	if not dead:
		var playerInput = get_input()
		velocity = lerp(velocity, playerInput * speed, delta * acceleration)
	else:
		velocity = Vector2(0,0)
	if Global.greed <= 0 and not $Animations.is_playing():
		dead = true
		$Animations.play("greed_death")
	move_and_slide()
func animate():
	if dead:
		player_sprite.speed_scale = 0
	if velocity.x > 15 || velocity.y > 15 || velocity.x < -15 || velocity.y < -15:
		player_sprite.play("run")
		if $footsteps.playing == false:
			$footsteps.playing = true
	else:
		player_sprite.play("idle")
		$footsteps.playing = false
func flip():
	#print("mouse: ", get_global_mouse_position().x)
	#print("character: ", player.global_position.x )
	if player.global_position.x > get_global_mouse_position().x and not dead:
		meele_spawn = $MeleeLeft
		Abilities.direction_flip = true
		player_sprite.flip_h = true
		
	if player.global_position.x < get_global_mouse_position().x and not dead:
		meele_spawn = $MeleeRight
		Abilities.direction_flip = false
		player_sprite.flip_h = false
@onready var primary_attack_scene = preload("res://scenes/attacks/magic_shot.tscn")
func primary_attack():
	if Input.is_action_just_pressed("primary") and not dead:
		if Abilities.primary_ability["type"] == "melee":
			print("Melee attacking...")
			print(Global.current_health)
			var spawn = meele_spawn.position
			Abilities.primary(spawn, stats.attack)
		elif Abilities.primary_ability["type"] == "ranged" and not dead:
			print("Ranged attcking...")
			var spawn = $ProjectileSpawner.global_position
			Abilities.primary(spawn, stats.attack)
			if Abilities.can_ranged_attack:
				cast_sfx(Abilities.primary_ability)
			handle_cooldowns(Abilities.primary_ability, "primary")
		else:
			print("Unimplemented attack type...")
func secondary_attack():
	if Input.is_action_just_pressed("secondary"):
		if Abilities.secondary_ability["type"] == "melee":
			print("Melee attacking...")
			var spawn = meele_spawn.position
			Abilities.secondary(spawn, stats.attack)
		elif Abilities.secondary_ability["type"] == "ranged":
			print("Ranged attcking...")
			var spawn = $ProjectileSpawner.global_position
			Abilities.secondary(spawn, stats.attack)
			if Abilities.can_ranged_attack_secondary:
				cast_sfx(Abilities.secondary_ability)
			handle_cooldowns(Abilities.secondary_ability, "secondary")

		else:
			print("Unimplemented attack type...")
func _on_stat_system_dead():
	dead = true
	animations.play("dead")
	emit_signal("player_dead")

func _on_animations_animation_finished(anim_name):
	if anim_name == "dead" or "greed_death":
		get_tree().set_pause(true)
		$game_over.visible = true
		
func save_stats():
	Global.current_health = stats.current_health
	Global.max_health = stats.max_health
	Global.defense = stats.defense 
	Global.attack = stats.attack
	Global.dodge = stats.dodge
	


func _on_stat_system_hit():
	save_stats()
	emit_signal("player_hit")
	


func _on_stat_system_healed():
	save_stats()
	emit_signal("player_healed")
	print("player healed")
func handle_cooldowns(ability, position):
	if position == "primary":
		if Abilities.can_ranged_attack:
			if ability["type"] == "ranged":
				if ability["cooldown"] > 0:
					Abilities.can_ranged_attack = false
					print("cooldown", ability["cooldown"])
					$cooldowns.wait_time = ability["cooldown"]
					$cooldowns.start()
				else:
					return
			else:
				return
		else:
			return
	elif position == "secondary":
		if Abilities.can_ranged_attack_secondary:
			if ability["type"] == "ranged":
				if ability["cooldown"] > 0:
					Abilities.can_ranged_attack_secondary = false
					print("cooldown", ability["cooldown"])
					$secondary.wait_time = ability["cooldown"]
					$secondary.start()
				else:
					return
			else:
				return

func _on_cooldowns_timeout():
	Abilities.can_ranged_attack = true


func _on_secondary_timeout():
	Abilities.can_ranged_attack_secondary = true
	
func cast_sfx(ability):
	print("playing...")
	print(ability["sfx"])
	$cast.stream = load(ability["sfx"])
	
	$cast.play()
	print("palying? ", $cast.playing)
