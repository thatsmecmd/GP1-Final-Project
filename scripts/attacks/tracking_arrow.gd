extends Area2D
var speed = 100
var direction = Vector2.RIGHT
var damage = 20
@onready var sprite = $Sprite2D as Sprite2D
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	print(rad_to_deg(direction.angle_to(Vector2(1,0))))
	sprite.rotation_degrees = (rad_to_deg(direction.angle()))
	var movement = direction.normalized() * speed * delta
	position += movement





func _on_tracking_area_body_entered(body):
	if body.has_method("take_hit"):
		direction = body.global_position - self.global_position


func _on_tracking_ping_timeout():
	if $tracking_area.monitoring == true:
		$tracking_area.monitoring = false
	else:
		$tracking_area.monitoring = true


func _on_body_entered(body):
	if body.has_method("take_hit"):
		body.take_hit(damage)
