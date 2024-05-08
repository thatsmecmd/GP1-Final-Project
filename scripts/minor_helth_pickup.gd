extends Area2D

var items = {
	"banana" : {
		"name" : "Banana",
		"value" : 10,
		"sprite" : "res://assets/Kyrise's 16x16 RPG Icon Pack - V1.3/icons/16x16/fruit_01b.png"
	},
	"apple" : {
		"name" : "Apple",
		"value" : 20,
		"sprite" : "res://assets/Kyrise's 16x16 RPG Icon Pack - V1.3/icons/16x16/fruit_01a.png"
	},
	"cookie" : {
		"name" : "Cookie",
		"value" : 25,
		"sprite" : "res://assets/Kyrise's 16x16 RPG Icon Pack - V1.3/icons/16x16/cookie_01a.png"
	},
	"candy" : {
		"name" : "Candy",
		"value" : 25,
		"sprite" : "res://assets/Kyrise's 16x16 RPG Icon Pack - V1.3/icons/16x16/candy_02a.png"
	},
	"minor_potion" : {
		"name" : "Minor Healing Potion",
		"value" : 50,
		"sprite" : "res://assets/Kyrise's 16x16 RPG Icon Pack - V1.3/icons/16x16/potion_01a.png"
	},
}
var items_list = items.keys()
var random_item 
# Called when the node enters the scene tree for the first time.
func _ready():
	random_item = items_list[randi() % items_list.size()]
	$Sprite2D.texture = load(items[random_item]["sprite"])
	#labels maybe


func _on_body_entered(body):
	if body.has_node("StatSystem"):
		var stats = body.get_node("StatSystem")
		stats.heal(items[random_item]["value"])
		print(stats.current_health)
	self.queue_free()
