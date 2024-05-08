extends CanvasLayer

@onready var main_vbox = $MainVbox
@onready var option_v_box = $OptionVBox

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func translate(language_code):
	TranslationServer.set_locale(language_code)

func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://scenes/TestFolder/LPTest.tscn")

func _on_quit_button_pressed():
	get_tree().quit()

func _on_options_button_pressed():
	main_vbox.visible = false
	option_v_box.visible = true

func _on_back_button_pressed():
	main_vbox.visible = true
	option_v_box.visible = false

func _on_save_button_pressed():
	pass # Replace with function body.

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
