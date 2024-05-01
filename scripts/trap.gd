extends Node2D

@onready var closed = $closed
@onready var open = $open
@onready var T_open = $Timer_open
@onready var T_closed = $Timer_closed

func _ready():
	T_closed.start()

func _on_timer_open_timeout():
	print("test open")
	closed.visible = true
	open.visible = false
	T_closed.start()


func _on_timer_closed_timeout():
	print("test close")
	closed.visible = false
	open.visible = true
	T_open.start()


func _on_area_2d_body_entered(body):
	if body.has_node("StatSystem"):
		var stats = body.get_node("StatSystem")
		stats.take_damage(5)
	else:
		pass