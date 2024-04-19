extends CharacterBody2D


@onready var player_sprite = $playerSprite

@export var speed = 200

@export var acceleration = 5
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
	print(velocity)
	if velocity.x > 15 || velocity.y > 15 || velocity.x < -15 || velocity.y < -15:
		player_sprite.play("run")
	else:
		player_sprite.play("idle")
func flip():
	if velocity.x < 0:
		player_sprite.flip_h = true
		
	if velocity.x > 0:
		player_sprite.flip_h = false
