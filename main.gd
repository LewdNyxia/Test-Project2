extends Control


@onready var room_manager = $RoomManager
@onready var playfield = $"/root/Playfield"
@onready var label = $MarginContainer/BoxContainer/VBoxContainer/HBoxContainer/MarginContainer2/MarginContainer/MainTextPort



func _on_check_button_toggled(toggled_on: bool) -> void:
	var window = toggled_on
	if window == true: DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN) 
	elif window == false: DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED) 
var current_room = null
func initialize(starting_room):
	current_room = starting_room

func updateText(text):
	label.text = text


##func _ready() -> void:
##	initalize(room_manager.get_child(0))
##	updateText("AAAAA")



	
	
