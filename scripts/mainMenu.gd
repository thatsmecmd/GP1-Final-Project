extends CanvasLayer

@onready var main_vbox = $MainVbox
@onready var option_v_box = $OptionVBox

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://scenes/proto_level.tscn")

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
