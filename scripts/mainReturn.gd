extends Area2D




func _on_body_entered(body):
	print("Prototype ended")
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
