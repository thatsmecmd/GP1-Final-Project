extends Area2D
var speed = 100
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
	if body is TileMap:
		print("Tilemap enter")
		self.queue_free()
	
	if body.has_node("StatSystem"):
		
		var stats = body.get_node("StatSystem")
		stats.take_damage(10)
		self.queue_free()
	#if body.has_method("take_hit"):
		#body.take_hit(damage)
		#self.queue_free()
		
