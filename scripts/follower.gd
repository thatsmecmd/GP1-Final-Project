extends AnimatableBody2D
class_name Follower

@export var target: Node2D # the target to follo
@export var range: float # The range in which the follower stops following the target
@export var speed: float # The speed at which the follower walks

@export var walk_string: String
@export var die_string: String
@export var idle_string: String

var attacking: bool = false # if the follower is currently attacking
var is_dead: bool = false # check if the follower is dead
var sprite: AnimatedSprite2D # The follower's sprite
var stopped = false # if the follower is stopped or not
var flipped = false
@onready var stats: StatSystem = $StatSystem # all the enemy's stats.

func _ready():
	sync_to_physics = false
	sprite = get_node("AnimatedSprite2D")
	stats.dead.connect(_on_statsystem_dead)
	stats.hit.connect(_on_statsystem_hit)
	
func _physics_process(delta):	
	# checks if the target exists or if it's dead. If it doesn't, return.
	if(!target or is_dead):
		return
	
	# get the directional vector
	var direction = target.global_position - global_position
	
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
	var move_vector: Vector2 = direction * speed
	move_and_collide(move_vector)

# flips the follower to look in the target's direction
func flip(direction: Vector2):
	# look at the scale and the direction. Only flip if they are different:
	var side: int = 1
	if direction.x >= 0: 
		side = 1
	if direction.x < 0: 
		side = -1
		
	if not scale.x == side:
		scale.x = abs(scale.x) * -1
		print(scale.x, ", ", side)
	
# take damage 
func _on_statsystem_hit(damage: float):
	# use a tween to indicate that the enemy was hit
	var tween = get_tree().create_tween()
	tween.tween_property(self, "modulate", Color.RED, 0.1)
	tween.tween_property(self, "modulate", Color.WHITE, 0.1)
	
# checks if follower is in range
func is_in_range(direction: Vector2):
	return (direction.length() < range)
	
# kills the follower
func _on_statsystem_dead():
	is_dead = true
	sprite.play(die_string)
	await sprite.animation_finished
	queue_free()
