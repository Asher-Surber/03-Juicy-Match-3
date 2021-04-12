extends Node2D

#onready var sparkles = get_node("Sparkles

export (String) var color
var is_matched
var is_counted
var selected = false
var target_position = Vector2(0,0)
var default_modulate = Color(1,1,1,1)
var highlight = Color(1,0.8,0,1)


var dying = false

func _ready():
	default_modulate = modulate
	#sparkles.emitting = false

func _physics_process(_delta):
	if dying:
		queue_free()
	if selected:
		if modulate != highlight:
			modulate = highlight
	else:
		if modulate != default_modulate:
			modulate = default_modulate
		

func move_piece(change):
#	$Swap.interpolate_property(self, "position", position, position+change, 1, Tween.TRANS_EXPO, Tween.EASE_IN)
#	$Swap.start()
	target_position = position + change
	position = target_position

func die():
	
	dying = true;
	
