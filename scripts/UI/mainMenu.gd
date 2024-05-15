extends CanvasLayer

@onready var main_vbox = $MainVbox
@onready var option_v_box = $OptionVBox
var current_best
func _ready():
	current_best = Global.best_floor
	if FileAccess.file_exists("user://saveGREEDHERO.save"):
		var save_data = SaveData.load_data()
		if save_data:
			var saved_language = save_data["language"]
			translate(save_data["language"])
			load_highscore(save_data["high_score"])


func translate(language_code):
	TranslationServer.set_locale(language_code)
	SaveData.current_language = language_code

func load_highscore(high_score):
	Global.best_floor = high_score

func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://scenes/character_select.tscn")

func _on_quit_button_pressed():
	get_tree().quit()


func _on_options_button_pressed():
	main_vbox.visible = false
	option_v_box.visible = true

func _on_back_button_pressed():
	main_vbox.visible = true
	option_v_box.visible = false

func _on_save_button_pressed():
	SaveData.save_game()

func _on_english_button_pressed():
	translate("en")

func _on_french_button_pressed():
	translate("fr")

func _on_spanish_button_pressed():
	translate("es")

func _on_volume_slider_value_changed(value):
	var bus_index = AudioServer.get_bus_index("Master")
	var new_volume = linear_to_db(value)
	AudioServer.set_bus_volume_db(bus_index,new_volume)


func _on_default_pressed():
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	get_window().size = Vector2(1152, 648)


func _on_fullscreen_pressed():
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)


func _on_windowed_pressed():
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	get_window().size = Vector2(1920, 1080)

func _on_tutorial_button_pressed():
	get_tree().change_scene_to_file("res://scenes/tutorial.tscn")
