extends CanvasLayer

@onready var player = $".."
@onready var health_bar = $"HealthBar"
@onready var greed_bar = $HSlider
var game_over_scene = preload("res://scenes/game_over.tscn")
var current_greed = 100

signal take_damage
signal heal_player

func _ready():
	current_greed = Global.greed

func _process(delta):
	if !(current_greed == Global.greed):
		greed_bar.value = Global.greed

func _on_player_player_hit():
	take_damage.emit()

func _on_player_player_dead():
	if(player):
		var game_over = game_over_scene.instantiate()
		player.add_child(game_over)

func _on_greed_timer_timeout():
	Global.greed -= 1
	current_greed = Global.greed
	greed_bar.value = current_greed


func _on_player_player_healed():
	heal_player.emit()
