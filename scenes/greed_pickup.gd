extends Area2D
signal taken
var items = {
	"gold_bar" : {
		"name" : "Gold Bar",
		"value" : 50,
		"sprite" : "res://assets/Kyrise's 16x16 RPG Icon Pack - V1.3/icons/16x16/ingot_01d.png"
	},
	"amathyst" : {
		"name" : "Amathyst",
		"value" : 100,
		"sprite" : "res://assets/Kyrise's 16x16 RPG Icon Pack - V1.3/icons/16x16/crystal_01j.png"
	},
	"saphire" : {
		"name" : "Saphire",
		"value" : 150,
		"sprite" : "res://assets/Kyrise's 16x16 RPG Icon Pack - V1.3/icons/16x16/crystal_01c.png"
	},
	"topaz" : {
		"name" : "topaz",
		"value" : 175,
		"sprite" : "res://assets/Kyrise's 16x16 RPG Icon Pack - V1.3/icons/16x16/crystal_01b.png"
	},
	"emrald" : {
		"name" : "Emrald",
		"value" : 200,
		"sprite" : "res://assets/Kyrise's 16x16 RPG Icon Pack - V1.3/icons/16x16/crystal_01a.png"
	},
	"ruby" : {
		"name" : "Ruby",
		"value" : 250,
		"sprite" : "res://assets/Kyrise's 16x16 RPG Icon Pack - V1.3/icons/16x16/crystal_01d.png"
	},
	"diamond" : {
		"name" : "Diamond",
		"value" : 300,
		"sprite" : "res://assets/Kyrise's 16x16 RPG Icon Pack - V1.3/icons/16x16/crystal_01e.png"
	},
	"abyssal_bauble" : {
		"name" : "Abyssal Bauble",
		"value" : 500,
		"sprite" : "res://assets/Kyrise's 16x16 RPG Icon Pack - V1.3/icons/16x16/crystal_01i.png"
	}
}
var items_list = items.keys()
var random_item 
# Called when the node enters the scene tree for the first time.
func _ready():
	random_item = items_list[randi() % items_list.size()]
	$Sprite2D.texture = load(items[random_item]["sprite"])
	#labels maybe



func _on_body_entered(body):
	Global.greed += items[random_item]["value"]
	print("Greed: ",Global.greed)
	emit_signal("taken")
	self.queue_free()


func _on_stat_pickup_taken():
	self.queue_free()
