extends Node
@export var hp_scale = 0
@export var def_scale = 0
@export var attack_scale = 0
@export var dodge_scale = 0 #I don't reccomend scaling this stat
@export var exp_yield_scale = 0
var stat_system = "N.A"
# Called when the node enters the scene tree for the first time.
func _ready():
	
	if get_parent().has_node("StatSystem"):
		stat_system = $"../StatSystem"
		scale()
	else:
		print("NO STAT SYSTEM, CANNOT SCALE STATS")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func scale():
	stat_system.max_health += (hp_scale * Global.floor)
	stat_system.attack += (attack_scale * Global.floor)
	stat_system.defense += (def_scale * Global.floor)
	stat_system.dodge += (dodge_scale * Global.floor)
	stat_system.exp_yield += (exp_yield_scale * Global.floor)
	stat_system.reset_health()