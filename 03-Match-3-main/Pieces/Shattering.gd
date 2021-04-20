extends AudioStreamPlayer
#
#onready var Piece = get_node("Piece")
#
#
func _ready():
	pass
#
#
#func _on_Shattering_tree_entered():
#	play()


func _on_Shattering_finished():
	self._set_playing(false)
