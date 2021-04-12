extends Button



func _on_Back_to_Menu_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://UI/Menu.tscn")
