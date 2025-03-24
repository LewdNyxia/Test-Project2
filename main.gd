extends Control


@onready var room_manager = $RoomManager
@onready var playfield = $"/root/Playfield"
@onready var label = $MarginContainer/BoxContainer/VBoxContainer/HBoxContainer/MarginContainer2/MarginContainer/MainTextPort

var HID = 0
var VID = 0
var N = 0
var S = 0
var W = 0
var E = 0


func _on_check_button_toggled(toggled_on: bool) -> void:
	var window = toggled_on
	if window == true: DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN) 
	elif window == false: DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED) 
var current_room = null
func initialize(starting_room):
	current_room = starting_room

func updateText(text):
	label.text = text

func RoomData(IDH, IDV, exitN, exitS, exitE, exitW, name, description):
	updateText("You are in" +name +description)
	HID = IDH
	VID = IDV
	N = exitN
	S = exitS
	W = exitW
	E = exitE


func _on_north_pressed() -> void:
	if N == 1
		


func _on_west_pressed() -> void:
	pass # Replace with function body.


func _on_south_pressed() -> void:
	pass # Replace with function body.


func _on_east_pressed() -> void:
	pass # Replace with function body.
