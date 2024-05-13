extends Node2D

@onready var closed = $closed
@onready var open = $open
@onready var T_open = $Timer_open
@onready var T_closed = $Timer_closed
@onready var trap_area = $open/Area2D

var damage = 3

func _ready():
	T_closed.start()

func _on_timer_open_timeout():
	closed.visible = true
	open.visible = false
	trap_area.monitoring = false
	T_closed.start()


func _on_timer_closed_timeout():
	closed.visible = false
	open.visible = true
	trap_area.monitoring = true
	T_open.start()


#func _on_area_2d_body_entered(body):
#	if body.has_node("StatSystem"):
#		var stats = body.get_node("StatSystem")
#		stats.take_damage(damage)
#	else:
#		pass


func _on_area_2d_area_entered(area):
	if area.get_parent().has_node("StatSystem"):
		var stats = area.get_parent().get_node("StatSystem")
		stats.inert_attack(3)
