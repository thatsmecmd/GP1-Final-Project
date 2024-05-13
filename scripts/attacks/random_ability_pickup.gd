extends Area2D

var sprite_Path
var ability
var action

# Called when the node enters the scene tree for the first time.
func _ready():
	var list_of_abilities = Abilities.abilities.keys()
	ability = list_of_abilities[randi_range(0,(list_of_abilities.size()) -1)]
	action = Abilities.abilities[ability]["action"]
	sprite_Path = Abilities.abilities[ability]["sprite"]
	var sprite = load(sprite_Path)
	action = Abilities.abilities[ability]["action"]
	$Sprite2D.texture = sprite
	$ItemLabel.text = Abilities.abilities[ability]["name"]
	$PickupOverlay/VBoxContainer/NameLabel.text = Abilities.abilities[ability]["name"] + " (" + action + ")"
	$PickupOverlay/VBoxContainer/DescriptionLabel.text = Abilities.abilities[ability]["flavor"]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):

	$".".visible = false
	$".".monitoring = false
	if action == "primary":
		Abilities.set_primary(ability)
	elif action == "secondary":
		Abilities.set_secondary(ability)
	#$"PickupOverlay".visible = true
	#$OverlayTime.start()

func _on_overlay_time_timeout():

		self.queue_free()
	
