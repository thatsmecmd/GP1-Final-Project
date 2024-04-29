extends Area2D
class_name Follower

@export var target: Node2D # the target to follo
@export var range: float # The range in which the follower stops following the target
@export var speed: float # The speed at which the follower walks
@export var health: float # The amount of health the follower has
@export var attacking: bool = false # if the follower is currently attacking

@export var walk_string: String
@export var die_string: String
@export var idle_string: String

var is_dead: bool = false # check if the follower is dead
var sprite: AnimatedSprite2D
var stopped = false

func _ready():
	sprite = get_node("AnimatedSprite2D")
	
func _physics_process(delta):	
	if(health <= 0 && !is_dead):
		die()
	# checks if the target exists or if it's dead. If it doesn't, return.
	if(!target or is_dead):
		return
	
	# get the directional vector
	var direction = target.position - position
	
	# if the enemy is not in range, move the player. Else, stop moving and play idle animation
	# This whole mess is there to prevet the stopping from playing every frame, only the first time the enemy
	# is outside of range. That way, it can attack the player without stoping the animation mid way
	if(!is_in_range(direction) && !attacking):
		move(direction.normalized())
		stopped = false
	else:
		if(!stopped):
			stopped = true
		else:
			sprite.play(idle_string)
	
	# flip the follower
	flip(direction.normalized())

# moves the follower towards the target
func move(direction: Vector2):
	sprite.play(walk_string)
	position += direction * speed

# flips the follower to look in the target's direction
func flip(direction: Vector2):
	var side: int
	if(direction.x > 0):
		side = 1
	else:
		side = -1
	scale.x =  abs(scale.x) * side
	
# take damage 
func take_damage(damage: float):
	# apply the damage
	health -= damage
	
	# use a tween to indicate that the enemy was hit
	var tween = get_tree().create_tween()
	tween.tween_property(self, "modulate", Color.RED, 0.1)
	tween.tween_property(self, "modulate", Color.WHITE, 0.1)
	
# checks if follower is in range
func is_in_range(direction: Vector2):
	return (direction.length() < range)
	
# kills the follower
func die():
	is_dead = true
	sprite.play(die_string)
	await sprite.animation_finished
	queue_free()
