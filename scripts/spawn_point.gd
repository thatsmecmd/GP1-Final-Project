extends Node2D

@export var enemy: String = "Skeleton_Warrior"

var enemies = {
	"Skeleton_Warrior": "res://scenes/enemies/skeleton_warrior.tscn"
}

# Called when the node enters the scene tree for the first time.
func _ready():
	var scene = load(enemies[enemy])
	var instance = scene.instantiate()
	instance.position = Vector2(0, 0)
	add_child(instance)
	instance.target = self
	
	var parent = get_parent()
	if(parent is Area2D):
		(parent as Area2D).body_entered.connect(_on_enemy_area_body_entered)
		(parent as Area2D).body_exited.connect(_on_enemy_area_body_exited)


func _on_enemy_area_body_entered(body):
	if(body is CharacterBody2D):
		get_child(0).switch_target(true, body)


func _on_enemy_area_body_exited(body):
	get_child(0).switch_target(false)
