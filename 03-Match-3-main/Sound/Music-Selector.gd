extends AudioStreamPlayer


##onready var Music = get_node("Music")
#var trackList = ["res://Sound/Peaceful Place.ogg", "res://Sound/Cleyton RX - Underwater.wav"]
#
func _ready():
	set_track()
#
#
#func newTrack():
#	randomize()
#	var track = randi() % 3
#	var current = $Music.get_stream_playback
#	current.set_stream(trackList[track-1])
#	play()
#
#
#func _on_Music_finished():
#	newTrack()
#
#
#func _on_Music_tree_entered():
#	newTrack()

func set_track():
	if Global.level == 1:
		$Music1.playing = true
	elif Global.level == 2:
		$Music2.playing = true
