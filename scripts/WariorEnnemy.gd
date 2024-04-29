extends Follower

@export var attack_string: String # name of the attack animation
@export var timer: Timer
@export var weapon: Node2D
@export var player: AnimationPlayer

var is_timer_finished: bool = true
# There must be an attack method

func _process(delta):
	if is_in_range(target.position - position):
		attack()

func attack():
	if(is_timer_finished):
		is_timer_finished = false
		timer.start()
		player.play("sword_swing")
		


func _on_timer_timeout():
	is_timer_finished = true
