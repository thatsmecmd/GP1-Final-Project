extends CanvasLayer

@onready var player = $".."
@onready var health_bar = $"HealthBar"
var game_over_scene = preload("res://Scenes/game_over.tscn")

signal take_damage
signal heal_player
func _process(delta):
	pass

func _on_player_player_hit():
	take_damage.emit()

func _on_player_player_dead():
	if(player):
		var game_over = game_over_scene.instantiate()
		player.add_child(game_over)

func _on_greed_timer_timeout():
	pass # Replace with function body.
