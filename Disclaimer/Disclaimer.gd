extends Control

var can_player_play = false

var key_presses : int

func _init():
	SettingsManager.load_settings()
	OS.window_fullscreen = SettingsManager.fullscreen
	AudioServer.set_bus_mute(1, SettingsManager.music_mute)

func _ready():
	$AnimationPlayer.play("Disclaimer")
	if GlobalFlags.skip_disclaimer:
		print("Skipping disclaimer...")
		get_tree().change_scene("res://Main Menu/Main Menu.tscn")

func _unhandled_key_input(event):
	if event.is_pressed():
		if can_player_play:
			get_tree().change_scene("res://Main Menu/Main Menu.tscn")
		else:
			print("Ah ah ah, you have to say the magic word")
			key_presses += 1
	if key_presses >= 10:
		print("Fine then, asshole")
		get_tree().change_scene("res://Main Menu/Main Menu.tscn")

func _on_PlzReadTimer_timeout():
	can_player_play = true
