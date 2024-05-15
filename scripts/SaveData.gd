extends Node

var current_language = "fr"
var high_score = 0

func save():
	var save_dict = {
		"language" = current_language,
		"high_score" = high_score
	}
	return save_dict

func _ready():
	get_tree().auto_accept_quit = false

func save_game():
	var save_game = FileAccess.open("user://saveGREEDHERO.save", FileAccess.WRITE)
	var json_string = JSON.stringify(save())
	save_game.store_line(json_string)

func load_data():
	var save_game = FileAccess.open("user://saveGREEDHERO.save", FileAccess.READ)
	var save_data
	while save_game.get_position() < save_game.get_length():
		var json_string = save_game.get_line()
		var json = JSON.new()
		var parse_result = json.parse(json_string)
		var node_data = json.get_data()
		save_data = node_data
	return save_data
