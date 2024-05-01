extends Area2D

const SPAWN_POINT_SRC = "res://scenes/enemies/spawn_point.tscn"

@export var number_of_enemy: int # The number of enemy to spawn in the area
@onready var area: CollisionShape2D = $CollisionShape2D # the area shape
@onready var spawn_point_scene = preload(SPAWN_POINT_SRC) # the spawn point scene

var top_left # area's top left coordinate 
var bottom_right # area's bottom right coordinate


# Called when the node enters the scene tree for the first time.
func _ready(): 
	get_coordinates()
	generate_spawnpoints()
	
	print("top left: ", top_left)
	print("bottom right: ", bottom_right)
	
func get_coordinates():
	# get the shape and throw an error if it's not a rectangle
	var shape: Shape2D = area.get_shape()
	if!(shape is RectangleShape2D):
		printerr("CollisionShape2D inside Enemy_Area MUST be a RectangleShape2D!")
		return
	
	# get the dimentions of the shape divided by two
	var half_length: float = shape.size.x / 2
	var half_height: float = shape.size.y / 2
	
	# get the coordinates by substracting/adding the half dimentions to the position coordinates
	top_left = Vector2(area.global_position.x - half_length, area.global_position.y - half_height)
	bottom_right = Vector2(area.global_position.x + half_length, area.global_position.y + half_height)
	
# instantiates a spawnpoint at a random spot within the area
func generate_spawnpoints():
	for i in number_of_enemy:
		var instance = spawn_point_scene.instantiate()
		instance.global_position = generate_position_within_area()
		add_child(instance)
	
func generate_position_within_area():
	var rng = RandomNumberGenerator.new() # the random generator instance
	var spawn_point_position = Vector2() # the position of the point
	
	# generating random x and y values on x and y based on the area's coordinates
	spawn_point_position.x = rng.randf_range(top_left.x, bottom_right.x)
	spawn_point_position.y = rng.randf_range(top_left.y, bottom_right.y)
	
	# returning the new point
	return spawn_point_position
