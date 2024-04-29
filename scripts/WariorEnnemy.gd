extends Follower

@onready var timer: Timer= $Timer
@onready var weapon: Node2D = $Weapon
@onready var player: AnimationPlayer = $Weapon/AnimationPlayer
@onready var weapon_hitbox: Area2D = $Weapon/Area2D

var is_timer_finished: bool = true

func _process(delta):
	# If the target is in range, call attack method
	if is_in_range(target.position - position):
		attack()

func attack():
	# If the timer is finished, start it back and perform attack animation
	if(is_timer_finished):
		is_timer_finished = false
		timer.start()
		player.play("attack")


func _on_timer_timeout():
	is_timer_finished = true
