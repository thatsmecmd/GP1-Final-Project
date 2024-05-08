extends AnimatableBody2D
class_name Follower

@export var target: Node2D # the target to follo
@export var range: float # The range in which the follower stops following the target
@export var speed: float # The speed at which the follower walks

@export var walk_string: String
@export var die_string: String
@export var idle_string: String
@export var drop_percentage: int = 25

var attacking: bool = false # if the follower is currently attacking
var is_dead: bool = false # check if the follower is dead
var sprite: AnimatedSprite2D # The follower's sprite
var stopped = false # if the follower is stopped or not
@onready var stats: StatSystem = $StatSystem # all the enemy's stats.
var is_flipped = false # if the follower is flipped or not
const flip_tolerance = 0.1  # tolerance for flipping. Do not touch
@onready var health_collectable = load("res://scenes/minor_helth_pickup.tscn")

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
	if direction.x < -flip_tolerance and !is_flipped:
		is_flipped = true
		scale.x *= -1  # Flip scale horizontally if direction.x is negative and not already flipped
	elif direction.x >= flip_tolerance and is_flipped:
		is_flipped = false
		scale.x *= -1  # Flip scale back to original if direction.x is non-negative and currently flipped

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
	# maybe add a health potion
	var rng = RandomNumberGenerator.new()
	var random_number = rng.randf()*100
	if(random_number < drop_percentage):
		# pick a random health item
		var instance = health_collectable.instantiate()
		instance.global_position = global_position
		get_tree().root.add_child(instance)
		pass
	queue_free()
