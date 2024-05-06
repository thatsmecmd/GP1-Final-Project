extends Area2D
var speed = 750
var direction = Vector2.RIGHT
var damage = 20
@onready var sprite = $AnimatedSprite2D as AnimatedSprite2D
func _ready():
	sprite.play("default")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var movement = direction.normalized() * speed * delta
	position += movement





func _on_body_entered(body):
	
	if body.has_node("StatSystem"):
		
		var stats = body.get_node("StatSystem")
		stats.take_damage(10)
		self.queue_free()


func _on_timer_timeout():
	self.queue_free()
