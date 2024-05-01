extends Area2D
var damage = 10
@onready var sprite = $Sprite

func _ready():
	Abilities.can_overhead_strike = false
	
func _on_body_entered(body):
	if body.has_node("StatSystem"):
		var stats = body.get_node("StatSystem")
		stats.take_damage(damage)
	else:
		return

func _on_animated_sprite_2d_animation_finished():
	self.queue_free()
	Abilities.can_overhead_strike = true

