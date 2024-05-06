extends Sprite2D


signal key_collect


func _on_area_2d_body_entered(body):
	emit_signal("key_collect")
	queue_free()
