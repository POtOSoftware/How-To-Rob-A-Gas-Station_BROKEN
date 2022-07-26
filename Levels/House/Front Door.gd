extends CSGBox

func _ready():
	use_collision = false

func interact():
	get_tree().change_scene("res://Levels/Gas Station Exterior/Gas Station Exterior.tscn")
