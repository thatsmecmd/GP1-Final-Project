extends CharacterBody2D


@onready var player_sprite = $playerSprite
@onready var player = $"." as CharacterBody2D


@export var speed = 500
@export var acceleration = 10


var input: Vector2
func get_input():
	input.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	input.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	return input.normalized()

func _physics_process(delta):
	animate()
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
