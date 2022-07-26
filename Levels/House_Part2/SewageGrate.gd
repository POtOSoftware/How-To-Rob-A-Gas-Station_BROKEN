extends StaticBody

func _process(delta):
	$CollisionShape.disabled = not visible

func interact():
	get_tree().change_scene("res://Levels/Sewer/Sewer.tscn")
