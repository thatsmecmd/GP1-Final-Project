extends CanvasLayer

signal take_damage

func _on_player_hit():
	take_damage.emit()
