extends Node
class_name StatSystem

var is_dead = false
@export var max_health = 100
@export var attack = 10
@export var defense = 0
@export var dodge = 0
@export var exp_yield = 0
var current_health = 1
signal dead
signal hit
signal healed

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
		if get_parent().has_node("playerSprite"):
			emit_signal("hit")
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
		if get_parent().has_node("playerSprite"):
			emit_signal("hit")
	else:
		print("Dodged!")
		pass
func sure_attack(damage):
	damage = damage - defense 
	if damage < 1:
		damage = 1
	current_health -= damage
	if get_parent().has_node("playerSprite"):
		emit_signal("hit")
func inert_attack(damage):
	current_health -= damage
	if get_parent().has_node("playerSprite"):
		emit_signal("hit")
func reduce_attack(reduction):
	attack = attack - reduction
	if attack <= 0:
		attack = 1
func reduce_defense(reduction):
	defense = defense - reduction
	if defense < 0:
		defense = 0
func reduce_dodge(reduction):
	dodge = dodge - reduction
	if dodge < 0:
		dodge = 0
func heal(health):
	current_health += health
	if current_health >max_health:
		current_health = max_health
	emit_signal("healed")
func add_defense(buff):
	defense += buff
func add_dodge(buff):
	dodge += buff
	#prevent imortality 
	if dodge >= 100:
		dodge = 99
func add_attack(buff):
	attack += buff
func add_hp(buff):
	max_health += buff
func reset_health():
	current_health = max_health
# Called when the node enters the scene tree for the first time.
func _ready():
	reset_health()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if current_health <= 0 && !is_dead:
		is_dead = true
		print("dead")
		emit_signal("dead")
