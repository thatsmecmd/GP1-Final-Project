extends Follower

@onready var timer: Timer= $Timer
@onready var weapon: Node2D = $Weapon
@onready var player: AnimationPlayer = $Weapon/AnimationPlayer
@onready var weapon_hitbox: Area2D = $Weapon/Area2D

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
		player.play("attack")


func _on_timer_timeout():
	is_timer_finished = true

func switch_target(is_player, new_target = get_parent()):
	target_is_player = is_player
	target = new_target
