extends Area2D
var damage = 10


# Called when the node enters the scene tree for the first time.
func _ready():
	$AudioStreamPlayer2D.stream = load(Abilities.abilities["flurry_of_blades"]["sfx"])
	$AudioStreamPlayer2D.play()
	Abilities.can_flurry_of_blades = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func _on_body_entered(body):
	if body.has_node("StatSystem") and $".".monitoring:
		var stats = body.get_node("StatSystem")
		stats.take_damage(damage)
	else:
		return


func _on_timer_timeout():
	if $".".monitoring == true:
		$".".monitoring = false
	else:
		$".".monitoring = true


func _on_animated_sprite_2d_animation_finished():
	self.queue_free()
	Abilities.can_flurry_of_blades = true
