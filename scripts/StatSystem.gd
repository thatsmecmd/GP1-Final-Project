extends Node
class_name StatSystem

var is_dead = false
@export var max_health = 100
@export var attack = 10
@export var defense = 0
@export var dodge = 0
var current_health = 1
signal dead
signal hit

func take_damage(damage):
	damage = damage - defense 
	current_health -= damage
	emit_signal("hit")
	print(current_health)
func dot():
	pass
func ap_attack():
	pass
func sure_attack():
	pass
# Called when the node enters the scene tree for the first time.
func _ready():
	current_health = max_health


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if current_health <= 0 && !is_dead:
		is_dead = true
		print("dead")
		emit_signal("dead")
		