extends AudioStreamPlayer2D

var music = ["res://assets/audio/soundtrack/Battle in the winter.mp3","res://assets/audio/soundtrack/Battle Theme 5.mp3",
"res://assets/audio/soundtrack/Fantasy Choir 2.wav","res://assets/audio/soundtrack/Fantasy Choir 3.wav","res://assets/audio/soundtrack/Vilified (2012).mp3",
"res://assets/audio/soundtrack/Wasteland Showdown.mp3"]


# Called when the node enters the scene tree for the first time.
func _ready():
	var random_song = randi() % music.size()
	stream = load(music[random_song])
	play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
