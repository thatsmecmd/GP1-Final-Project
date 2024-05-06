extends Follower

@onready var timer: Timer= $Timer
@onready var attack_sprite: AnimatedSprite2D = $Attack
@onready var weapon_hitbox: Area2D = $Attack/Area2D
@onready var projectile_preload = load("res://scenes/attacks/magic_shot.tscn")
@onready var magic_spawner = $Magic_Spawner

var is_timer_finished: bool = true
var target_is_player: bool = false # stops the enemy from attacking when once it reached it's target

func _process(delta):
	# If the target is in range, call attack method
	if(target):
		if is_in_range(target.global_position - global_position):
			attack()

func attack():
	# If the timer is finished, start it back and perform attack animation
	if(is_timer_finished && target_is_player):
		is_timer_finished = false
		timer.start()
		
		# spawn a projectile and have it move towards the player
		var projectile_instance = projectile_preload.instantiate() as Area2D
		projectile_instance.direction = (target.global_position - self.global_position).normalized()
		projectile_instance.damage = stats.attack
		projectile_instance.global_position = magic_spawner.position
		projectile_instance.collision_mask = 2
		add_child(projectile_instance)


func _on_timer_timeout():
	is_timer_finished = true

func switch_target(is_player, new_target = get_parent()):
	target_is_player = is_player
	target = new_target
