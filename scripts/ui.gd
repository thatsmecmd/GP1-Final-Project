extends CanvasLayer

signal take_damage

func _on_player_player_hit():
	take_damage.emit()

func _on_player_player_dead():
	pass # Replace with function body.
