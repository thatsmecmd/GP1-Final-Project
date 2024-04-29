extends Area2D
var speed = 250
var direction = Vector2.RIGHT
var damage = 20
@onready var sprite = $Sprite2D as Sprite2D
var hp = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	sprite.rotation_degrees = (rad_to_deg(direction.angle()))
	var movement = direction.normalized() * speed * delta
	position += movement

func _on_tracking_body_entered(body):
	if body.has_node("StatSystem"):
		direction = body.global_position - self.global_position


func _on_tracking_ping_timeout():
	if $tracking.monitoring == true:
		$tracking.monitoring = false
	else:
		$tracking.monitoring = true



func _on_body_entered(body):
	if body.has_node("StatSystem"):
		var stats = body.get_node("StatSystem")
		stats.take_damage(10)
		$idle_despawn.stop()
		$idle_despawn.start(5)
	#if body.has_method("take_hit"):
		#body.take_hit(damage)
		#$idle_despawn.stop()
		#$idle_despawn.start(5)
		#Abilities.testhp += 1
		#print(Abilities.testhp)


func _on_iframes_timeout():
	if $".".monitoring == true:
		$".".monitoring = false
	else:
		$".".monitoring = true


func _on_idle_despawn_timeout():
	self.queue_free()
	Abilities.possessed_knife_count -= 1
