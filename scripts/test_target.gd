extends StaticBody2D
@export var health = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if health <= 0:
		print("Dead")
		self.queue_free()
		
func take_hit(damage):
	health -= damage
