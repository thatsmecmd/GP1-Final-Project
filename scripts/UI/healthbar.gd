extends ProgressBar

@onready var health_bar = $"."
@onready var button = $"../Button"
@onready var damage_rect = $"../DamageRect"

# Called when the node enters the scene tree for the first time.
func _ready():
	health_bar.set_max(Global.max_health)
	health_bar.value = Global.current_health

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_ui_take_damage():
	var health_tween = create_tween()
	if(!(Global.current_health <= 0)):
		health_tween.tween_property(health_bar, "value", Global.current_health, 0.1)
	
	var red_tween = create_tween()
	red_tween.tween_property(damage_rect, "modulate", Color("ffffff"), 0.1)
	red_tween.tween_property(damage_rect, "modulate", Color.TRANSPARENT, 0.1)
