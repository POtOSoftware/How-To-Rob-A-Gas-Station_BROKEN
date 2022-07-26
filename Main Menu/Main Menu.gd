extends Control

func _ready():
	# This fixes a very specific bug where the dialog box will show up again after starting the game again
	DialogManager.dialog_name = ""
	DialogManager.dialog_text = ""
	
	#GlobalFlags.speedrun_mode = false
	$"Title Screen/VBoxContainer/StartGame/Speedrun Check".pressed = GlobalFlags.speedrun_mode
	
	if OS.get_name() == "HTML5":
		$"Title Screen/VBoxContainer/QuitGame".visible = false

	# If GLES2
	if OS.get_current_video_driver() == 1:
		$"Gas Station Exterior/WorldEnvironment".environment.ambient_light_energy = 2
	# If GLES3
	else:
		$"Gas Station Exterior/WorldEnvironment".environment.ambient_light_energy = 5

func _on_QuitGame_pressed():
	get_tree().quit()

func _on_StartGame_pressed():
	get_tree().change_scene("res://Levels/House/House.tscn")

func _on_Settings_pressed():
	$"Title Screen".visible = false
	$Settings.visible = true

func _on_StartGame_mouse_entered():
	$"Title Screen/VBoxContainer/StartGame/Speedrun Check".visible = true

func _on_Speedrun_Check_toggled(button_pressed):
	 GlobalFlags.speedrun_mode = button_pressed

func _on_Button_pressed():
	get_tree().change_scene("res://Levels/Credits/Credits.tscn")
