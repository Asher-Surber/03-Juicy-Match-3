extends Node2D

# Board Variables
export (int) var width 
export (int) var height 
export (int) var xStart 
export (int) var yStart 
export (int) var offset

var first_touch
var final_touch
var controlling = false



func pixel_to_grid(touch_position):
	var column = round((touch_position.x - xStart)/offset)
	var row = round((touch_position.y - yStart)/-offset)
	return Vector2(column, row)

func is_in_grid(touch_position):
	if(touch_position.x >= 0 && touch_position.x < width):
		if(touch_position.y >= 0 && touch_position.y < height):
			return true
	return false
	
func touch_difference(touch_1, touch_2):
	var difference = touch_2 - touch_1
	if(abs(difference.x) > abs(difference.y)):
		if(difference.x > 0):
			swap_pieces(touch_1.x, touch_1.y, Vector2(1, 0))
		elif(difference.x < 0):
			swap_pieces(touch_1.x, touch_1.y, Vector2(-1, 0))
	elif(abs(difference.y) > abs(difference.x)):
		if(difference.y > 0):
			swap_pieces(touch_1.x, touch_1.y, Vector2(0, 1))
		elif(difference.y < 0):
			swap_pieces(touch_1.x, touch_1.y, Vector2(0, -1))

func touch_input():
	if(Input.is_action_just_pressed("ui_touch")):
		if(is_in_grid(pixel_to_grid(get_global_mouse_position()))):
			controlling = true
			first_touch = pixel_to_grid(get_global_mouse_position())
			all_pieces[first_touch.x][first_touch.y].selected = true
	if(Input.is_action_just_released("ui_touch") && controlling):
		if(is_in_grid(pixel_to_grid(get_global_mouse_position()))):
			controlling = false
			final_touch = pixel_to_grid(get_global_mouse_position())
			all_pieces[first_touch.x][first_touch.y].selected = false
			touch_difference(first_touch, final_touch)
