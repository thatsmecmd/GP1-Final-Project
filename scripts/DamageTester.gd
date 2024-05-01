extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body.has_node("StatSystem"):
		var stats = body.get_node("StatSystem")
		stats.take_damage(10)
	


#func _on_area_entered(area):
	#print("Feet struck")
	pass
	#if area.get_parent().has_node("StatSystem"):
		#var stats = area.get_parent().get_node("StatSystem")
		#stats.take_damage(10)
