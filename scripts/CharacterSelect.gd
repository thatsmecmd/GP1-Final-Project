extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_wizzard_select_pressed():
	Global.max_health = 125
	Global.defense = 0
	Global.dodge = 5
	Global.attack = 20
	Global.current_health = Global.max_health
	Global.player_class = "Wizzard"
	Abilities.set_primary("fallen_stars")
	Abilities.set_secondary("magic_disk")
	get_tree().change_scene_to_file("res://scenes/proto_levelTO.tscn")
	


func _on_rogue_select_pressed():
	Global.max_health = 100
	Global.defense = 5
	Global.dodge = 20
	Global.attack = 25
	Global.current_health = Global.max_health
	Global.player_class = "Rogue"
	Abilities.set_primary("tracking_arrow")
	Abilities.set_secondary("flurry_of_blades")
	get_tree().change_scene_to_file("res://scenes/proto_levelTO.tscn")


func _on_knight_select_pressed():
	Global.max_health = 200
	Global.defense = 20
	Global.dodge = 0
	Global.attack = 10
	Global.current_health = Global.max_health
	Global.player_class = "Knight"
	Abilities.set_primary("overhead_strike")
	Abilities.set_secondary("flurry_of_blades")
	get_tree().change_scene_to_file("res://scenes/proto_levelTO.tscn")
