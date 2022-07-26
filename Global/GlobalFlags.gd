extends Node

var args = Array(OS.get_cmdline_args())

var super_secret_message = "Hey guys if you want cmdline arguments, they're right here"

var skip_disclaimer : bool
var speedrun_mode : bool = false

var rats_killed : int
var goombas_killed : int
var gun_grabbed : bool = false
var tech_chip_grabbed : bool = false
var tech_chip_filled : bool = false
var coping_and_seething : bool = false
var ex_killed : bool = false

# I didn't want to type out OS.is_debug_build() everytime
var debug = OS.is_debug_build()

func _input(event):
	if event is InputEventKey:
		if event.scancode == KEY_ESCAPE:
			# This is the only way I got it working.
			# get_tree()... == "Main Menu" or "Disclaimer" didn't work
			if get_tree().get_current_scene().get_name() == "Main Menu":
				pass 
			elif get_tree().get_current_scene().get_name() == "Disclaimer":
				pass
			else:
				get_tree().change_scene("res://Main Menu/Main Menu.tscn")
				Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _init():
	
	# Looks a mess, but tastes delicious
	if args.has("-skipdisclaimer"):
		skip_disclaimer = true
	
	if args.has("-debug"):
		debug = true
	
	if args.has("-faststart"):
		get_tree().change_scene("res://Levels/House/House.tscn")
	
	if args.has("-speedrun"):
		speedrun_mode = true
	
	if args.has("-window"):
		OS.window_fullscreen = false
	
	if args.has("-mute"):
		AudioServer.set_bus_mute(0, true)
