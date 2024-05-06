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
	Abilities.set_primary("magic_shot")
	Abilities.set_secondary("magic_disk")
	get_tree().change_scene_to_file("res://scenes/proto_levelTO.tscn")
	


func _on_rogue_select_pressed():
	Global.max_health = 100
	Global.defense = 5
	Global.dodge = 10
	Global.attack = 25
	Global.player_class = "Rogue"
	Abilities.set_primary("tracking_arrow")
	Abilities.set_secondary("flurry_of_blades")
	get_tree().change_scene_to_file("res://scenes/proto_levelTO.tscn")
