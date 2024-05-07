extends Area2D
signal taken
var items = {
	"leather_breastplate": {
		"name" : "Leather Breastplate",
		"stat" : "defense",
		"value" : 2,
		"sprite" : "res://assets/Kyrise's 16x16 RPG Icon Pack - V1.3/icons/16x16/armor_01a.png"
	},
	"iron_brestplate": {
		"name" : "Iron Brestplate",
		"stat" : "defense",
		"value" : 5,
		"sprite" : "res://assets/Kyrise's 16x16 RPG Icon Pack - V1.3/icons/16x16/armor_01b.png"
	},
	"blue_steel_breatplate" : {
		"name" : "Blue Steel Breastplate",
		"stat" : "defense",
		"value" : 7,
		"sprite" : "res://assets/Kyrise's 16x16 RPG Icon Pack - V1.3/icons/16x16/armor_01c.png"
	}, 
	"gilded_brestplate" : {
		"name" : "Gilded Brestplate",
		"stat" : "defense",
		"value" : 10,
		"sprite" : "res://assets/Kyrise's 16x16 RPG Icon Pack - V1.3/icons/16x16/armor_01d.png"
	},
	"adimantine_cuirass" : {
		"name" : "Adimantine Cuirass",
		"stat" : "defense",
		"value" : 15,
		"sprite" : "res://assets/Kyrise's 16x16 RPG Icon Pack - V1.3/icons/16x16/armor_01e.png"
	}, 
	"leather_helm" : {
		"name" : "Leather Helmet",
		"stat" : "max_hp",
		"value" : 10,
		"sprite": "res://assets/Kyrise's 16x16 RPG Icon Pack - V1.3/icons/16x16/helmet_01a.png"
	},
	"iron_helm" : {
		"name" : "Iron Helmet",
		"stat" : "max_hp",
		"value" : 20,
		"sprite" : "res://assets/Kyrise's 16x16 RPG Icon Pack - V1.3/icons/16x16/helmet_01b.png"
	},
	"blue_steel_helm" : {
		"name" : "Blue Steel Helmet",
		"stat" : "max_hp",
		"value" : 30,
		"sprite" : "res://assets/Kyrise's 16x16 RPG Icon Pack - V1.3/icons/16x16/helmet_01c.png"
	},
	"gilded_helm" : {
		"name" : "Gilded Helmet",
		"stat" : "max_hp",
		"value" : 40,
		"sprite" : "res://assets/Kyrise's 16x16 RPG Icon Pack - V1.3/icons/16x16/helmet_01d.png"
	},
	"adimantine_helm" : {
		"name" : "Adimantine Helmet",
		"stat" : "max_hp",
		"value" : 50,
		"sprite" : "res://assets/Kyrise's 16x16 RPG Icon Pack - V1.3/icons/16x16/helmet_01e.png"
	}, 
	"leather_gloves" : {
		"name" : "Leather Gloves",
		"stat" : "attack",
		"value" : 5,
		"sprite" : "res://assets/Kyrise's 16x16 RPG Icon Pack - V1.3/icons/16x16/gloves_01a.png"
	}, 
	"iron_gloves" : {
		"name" : "Iron Gloves",
		"stat" : "attack",
		"value" : 10,
		"sprite" : "res://assets/Kyrise's 16x16 RPG Icon Pack - V1.3/icons/16x16/gloves_01b.png"
	},
	"blue_steel_gloves" : {
		"name" : "Blue Steel Gloves",
		"stat" : "attack",
		"value" : 15,
		"sprite" : "res://assets/Kyrise's 16x16 RPG Icon Pack - V1.3/icons/16x16/gloves_01c.png"
	},
	"gilded_gloves" : {
		"name" : "Gilded Gloves",
		"stat" : "attack",
		"value" : 20,
		"sprite" : "res://assets/Kyrise's 16x16 RPG Icon Pack - V1.3/icons/16x16/gloves_01d.png"
	},
	"adimantine_gloves" : {
		"name" : "Adimantine Gloves",
		"stat" : "attack",
		"value" : 25,
		"sprite" : "res://assets/Kyrise's 16x16 RPG Icon Pack - V1.3/icons/16x16/gloves_01e.png"
	},
	"leather_boots" : {
		"name" : "Leather Boots",
		"stat" : "dodge",
		"value" : 1,
		"sprite" : "res://assets/Kyrise's 16x16 RPG Icon Pack - V1.3/icons/16x16/boots_01a.png"
	},
	"iron_boots" : {
		"name" : "Iron Boots",
		"stat" : "dodge",
		"value" : 2,
		"sprite" : "res://assets/Kyrise's 16x16 RPG Icon Pack - V1.3/icons/16x16/boots_01b.png"
	},
	"blue_steel_boots" : {
		"name" : "Blue Steel Boots",
		"stat" : "dodge",
		"value" : 3,
		"sprite" : "res://assets/Kyrise's 16x16 RPG Icon Pack - V1.3/icons/16x16/boots_01c.png"
	},
	"gilded_boots" : {
		"name" : "Gilded Boots",
		"stat" : "dodge",
		"value" : 5,
		"sprite" : "res://assets/Kyrise's 16x16 RPG Icon Pack - V1.3/icons/16x16/boots_01d.png"
	},
	"adimantine_boots" : {
		"name" : "Adimantine Boots", 
		"stat" : "dodge",
		"value" : 5,
		"sprite" : "res://assets/Kyrise's 16x16 RPG Icon Pack - V1.3/icons/16x16/boots_01e.png"
	},
	"major_potion" : {
		"name" : "Major Healing Potion",
		"stat" : "heal",
		"value" : 100,
		"sprite" : "res://assets/Kyrise's 16x16 RPG Icon Pack - V1.3/icons/16x16/potion_02a.png"
	},
	"mega_potion" : {
		"name" : "Mega Healing Potion",
		"stat" : "heal",
		"value" : 200 , 
		"sprite" : "res://assets/Kyrise's 16x16 RPG Icon Pack - V1.3/icons/16x16/potion_03a.png"
	},
	"healing_cup" : {
		"name" : "Chalice of Miracles",
		"stat" : "heal",
		"value" : 9999,
		"sprite" : "res://assets/Kyrise's 16x16 RPG Icon Pack - V1.3/icons/16x16/cup_02b.png"
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
		if items[random_item]["stat"] == "defense":
			stats.add_defense(items[random_item]["value"])
			print(stats.defense)
		elif items[random_item]["stat"] == "max_hp":
			stats.add_hp(items[random_item]["value"])
			print(stats.max_health)
		elif items[random_item]["stat"] == "dodge":
			stats.add_dodge(items[random_item]["value"])
		elif items[random_item]["stat"] == "attack":
			stats.add_attack(items[random_item]["value"])
		elif items[random_item]["stat"] == "heal":
			stats.heal(items[random_item]["value"])
		else:
			print("UNIMPLEMENTED")
		emit_signal("taken")
		self.queue_free()





func _on_greed_pickup_taken():
	self.queue_free()
