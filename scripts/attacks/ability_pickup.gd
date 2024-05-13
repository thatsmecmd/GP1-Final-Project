extends Area2D
@export var sprite:Texture
@export var ability:String 
@export var multi_use:bool
@export_enum("primary", "secondary") var action: String

# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite2D.texture = sprite
	$ItemLabel.text = Abilities.abilities[ability]["name"]
	$PickupOverlay/VBoxContainer/NameLabel.text = Abilities.abilities[ability]["name"] + " (" + action + ")"
	$PickupOverlay/VBoxContainer/DescriptionLabel.text = Abilities.abilities[ability]["flavor"]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if not multi_use:
		$".".visible = false
		$".".monitoring = false
	if action == "primary":
		Abilities.set_primary(ability)
	elif action == "secondary":
		Abilities.set_secondary(ability)
	#$"PickupOverlay".visible = true
	#$OverlayTime.start()

func _on_overlay_time_timeout():
	if !multi_use:
		self.queue_free()
	else:
		$PickupOverlay.visible = false
	
