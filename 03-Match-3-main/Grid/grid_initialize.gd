extends Node2D

# Board Variables
export (int) var width = 6
export (int) var height = 6
export (int) var xStart 
export (int) var yStart 
export (int) var offset

# Piece Stuff
var possible_pieces = [
	load("res://Pieces/Red.tscn"),
	load("res://Pieces/Green.tscn"),
	load("res://Pieces/Blue.tscn"),
	load("res://Pieces/Purple.tscn"),
	load("res://Pieces/Yellow.tscn"),
	load("res://Pieces/Orange.tscn"),
	load("res://Pieces/Teal.tscn"),
	load("res://Pieces/Pink.tscn")
]

var all_pieces
export (PackedScene) var background

func _ready():
	randomize()
	all_pieces = make_array()
	setup_board()
	generate_pieces()

func make_array():
	var matrix = [ ]
	for x in range(width):
		matrix.append([ ])
		for _y in range(height):
			matrix[x].append(0)
	return matrix

func setup_board():
	for i in width:
		for j in height:
			var b = background.instance()
			add_child(b)
			b.position = Vector2((xStart + (i * offset)), (yStart - (j * offset)))

func generate_pieces():
	for i in width:
		for j in height:
			var piece_to_use = floor(rand_range(0, possible_pieces.size()))
			if piece_to_use == 7:
				piece_to_use = 6
			piece = possible_pieces[piece_to_use].instance()
			
			var loops = 0
			while check_for_matches(i,j, piece.color) && loops < 100:
				piece_to_use = floor(rand_range(0, possible_pieces.size()))
				if piece_to_use == 6:
					piece_to_use = 5
				piece = possible_pieces[piece_to_use].instance()
				loops += 1
			
			add_child(piece)
			piece.position = Vector2(xStart + i * offset, yStart - j * offset)
			var target_pos = piece.position
			var appear_duration = randf()*2 + 1.0
			$Tween.interpolate_property(piece, "position", position, target_pos, appear_duration, Tween.TRANS_EXPO, Tween.EASE_IN_OUT)
			$Tween.start()
			all_pieces[i][j] = piece
