extends CharacterBody2D


@onready var player_sprite = $playerSprite
@onready var hands = $hands
@onready var staff = $staff
@onready var player = $"." as CharacterBody2D
@onready var animations = $Animations as AnimationPlayer


@export var speed = 500
@export var acceleration = 10
var spawn_point = 0

signal hit
var input: Vector2
func get_input():
	input.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	input.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	return input.normalized()

func _physics_process(delta):
	spawn_point = $ProjectileSpawner.global_position
	animate()
	primary_attack()
	secondary_attack()
	flip()
	var playerInput = get_input()
	velocity = lerp(velocity, playerInput * speed, delta * acceleration)
	move_and_slide()
func animate():
	if velocity.x > 15 || velocity.y > 15 || velocity.x < -15 || velocity.y < -15:
		player_sprite.play("run")
	else:
		player_sprite.play("idle")
func flip():
	#print("mouse: ", get_global_mouse_position().x)
	#print("character: ", player.global_position.x )
	if player.global_position.x > get_global_mouse_position().x:
		#True is left
		player_sprite.flip_h = true
		
	if player.global_position.x < get_global_mouse_position().x:
		#False is right 
		player_sprite.flip_h = false
@onready var primary_attack_scene = preload("res://scenes/attacks/magic_shot.tscn")
func primary_attack():
	if Input.is_action_just_pressed("primary"):
		var spawn = $ProjectileSpawner.global_position
		Abilities.primary(spawn, 1)
		#Abilities.magic_shot(spawn, 5)
	#
		#var new_attack = primary_attack_scene.instantiate() as Area2D
		#var spawn_pos = $ProjectileSpawner.global_position
		#print(spawn_pos - get_global_mouse_position())
		#new_attack.direction = get_global_mouse_position() - spawn_pos
		#new_attack.position = spawn_pos
		#player.get_parent().add_child(new_attack)
		
func secondary_attack():
	if Input.is_action_just_pressed("secondary"):
		var spawn = $ProjectileSpawner.global_position
		Abilities.secondary(spawn, 20)
		#Abilities.possessed_knife(spawn, 1)
		#Abilities.magic_disk(spawn,20)
		
		
func _on_stat_system_dead():
	animations.play("dead")

func _on_animations_animation_finished(anim_name):
	if anim_name == "dead":
		self.queue_free()
	
