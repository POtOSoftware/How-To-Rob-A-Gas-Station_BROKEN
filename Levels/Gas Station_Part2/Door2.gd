extends CSGBox

func _ready():
	use_collision = false

func interact():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	
	var chance = rng.randi_range(1, 4)
	
	print(chance)
	
	if $"..".clerk_killed:
		get_tree().change_scene("res://Levels/Arrested Cutscene/Arrested.tscn")
	elif GlobalFlags.coping_and_seething:
		get_tree().change_scene("res://Levels/House_Part2/House2.tscn")
	else:
		EndingManager.end_game("You got away with enough money to buy a PS5. Sweet! (Good Ending)")
