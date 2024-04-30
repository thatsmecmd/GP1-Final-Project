extends Node

var is_dead = false
@export var max_health = 100
@export var attack = 10
@export var defense = 0
@export var dodge = 0
var current_health = 1
signal dead

func take_damage(damage):
	var dodge_sim = randi() % 100 + 1
	print(dodge_sim)
	if dodge <= dodge_sim:
		print("hit")
		damage = damage - defense 
		if damage < 1:
			damage = 1
		current_health -= damage
		print(current_health)
	else:
		print("Dodged!")
		pass
func dot():
	pass
func ap_attack(damage):
	var dodge_sim = randi() % 100 + 1
	if dodge <= dodge_sim:
		print("hit")
		current_health -= damage
	else:
		print("Dodged!")
		pass
func sure_attack(damage):
	damage = damage - defense 
	if damage < 1:
		damage = 1
	current_health -= damage
func inert_attack(damage):
	current_health -= damage 
func reduce_attack(reduction):
	attack = attack - reduction
func reduce_defense(reduction):
	defense = defense - reduction
func reduce_dodge(reduction):
	dodge = dodge - reduction
func heal(health):
	current_health += health
	if current_health >max_health:
		current_health = max_health 
func add_defense(buff):
	defense += buff
func add_dodge(buff):
	dodge += buff
	#prevent imortality 
	if dodge >= 100:
		dodge = 99
# Called when the node enters the scene tree for the first time.
func _ready():
	current_health = max_health
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if current_health <= 0 && !is_dead:
		is_dead = true
		print("dead")
		emit_signal("dead")
		
