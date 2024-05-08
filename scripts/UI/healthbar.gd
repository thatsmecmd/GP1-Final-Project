extends ProgressBar

@onready var health_bar = $"."
@onready var damage_rect = $"../DamageRect"
@onready var heal_rect = $"../HealRect"

var cur_max_health = 100
# Called when the node enters the scene tree for the first time.
func _ready():
	health_bar.set_max(Global.max_health)
	cur_max_health = health_bar.max_value
	health_bar.value = Global.current_health

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !(cur_max_health == Global.max_health):
		health_bar.set_max(Global.max_health)
		cur_max_health = Global.max_health

func _on_ui_take_damage():
	var health_tween = create_tween()
	if(!(Global.current_health <= 0)):
		health_tween.tween_property(health_bar, "value", Global.current_health, 0.1)
	else:
		health_tween.tween_property(health_bar, "value", 0, 0.1)
	var red_tween = create_tween()
	red_tween.tween_property(damage_rect, "modulate", Color("ffffff"), 0.1)
	red_tween.tween_property(damage_rect, "modulate", Color.TRANSPARENT, 0.1)

func _on_ui_heal_player():
	var health_tween = create_tween()
	if(!(Global.current_health <= 0)):
		health_tween.tween_property(health_bar, "value", Global.current_health, 0.1)
	var green_tween = create_tween()
	green_tween.tween_property(heal_rect, "modulate", Color("ffffff"), 0.1)
	green_tween.tween_property(heal_rect, "modulate", Color.TRANSPARENT, 0.1)
