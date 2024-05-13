extends CanvasLayer
var lore_mode = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_wizzard_select_pressed():
	Global.greed = 100
	Global.max_health = 125
	Global.defense = 0
	Global.dodge = 5
	Global.attack = 20
	Global.current_health = Global.max_health
	Global.player_class = "Wizzard"
	Abilities.set_primary("fallen_stars")
	Abilities.set_secondary("magic_disk")
	get_tree().change_scene_to_file("res://scenes/rand_gen_floor.tscn")
	


func _on_rogue_select_pressed():
	Global.greed = 100
	Global.max_health = 100
	Global.defense = 5
	Global.dodge = 20
	Global.attack = 25
	Global.current_health = Global.max_health
	Global.player_class = "Rogue"
	Abilities.set_primary("tracking_arrow")
	Abilities.set_secondary("flurry_of_blades")
	get_tree().change_scene_to_file("res://scenes/rand_gen_floor.tscn")


func _on_knight_select_pressed():
	Global.greed = 100
	Global.max_health = 200
	Global.defense = 20
	Global.dodge = 0
	Global.attack = 1000
	Global.current_health = Global.max_health
	Global.player_class = "Knight"
	Abilities.set_primary("overhead_strike")
	Abilities.set_secondary("possessed_knife")
	get_tree().change_scene_to_file("res://scenes/rand_gen_floor.tscn")


func _on_lore_button_pressed():
	if lore_mode:
		lore_mode = !lore_mode
		$HBoxContainer2/CharacterSelect.visible = false
		$HBoxContainer2/BackgroundLore.visible  = true
		$HBoxContainer2/controls/LoreButton.text = "Back"
	else:
		lore_mode = !lore_mode
		$HBoxContainer2/CharacterSelect.visible = true
		$HBoxContainer2/BackgroundLore.visible = false
		$HBoxContainer2/controls/LoreButton.text = "Background"


func _on_main_menu_button_pressed():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
