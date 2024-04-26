extends RigidBody2D
var can_destroy = false 
var lifetime_expired = false
@onready var sprite = $AnimatedSprite2D as AnimatedSprite2D
var damage = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	sprite.play("default")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print(linear_velocity.x)
	if linear_velocity.x < 5 && can_destroy:
		self.queue_free()
	
	if lifetime_expired:
		self.queue_free()


func _on_initalizer_safety_timeout():
	can_destroy = true


func _on_lifetime_timeout():
	lifetime_expired = true


func _on_area_2d_body_entered(body):
	if body.has_method("take_hit"):
		body.take_hit(damage)
