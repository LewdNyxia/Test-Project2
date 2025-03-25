extends Control


@onready var room_manager = $RoomManager
@onready var playfield = $"/root/Playfield"
@onready var label = $MarginContainer/BoxContainer/VBoxContainer/HBoxContainer/MarginContainer2/MarginContainer/MainTextPort
@onready var House = room_manager.get_child(0)
var HID = 0
var VID = 0
var N = 0
var S = 0
var W = 0
var E = 0
func _ready() -> void:
	initialize(House)

func _on_check_button_toggled(toggled_on: bool) -> void:
	var window = toggled_on
	if window == true: DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN) 
	elif window == false: DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED) 

var current_room = null
func initialize(starting_room):
	changeRoom(starting_room)

func changeRoom(new_room: GameRoom):
	current_room = new_room
	var exit_string = PackedStringArray(new_room.exits.keys())
	var strings = "You are now in: " +new_room.room_name + ". It is " +new_room.room_description + \
	"\nYou can go " + ",".join(exit_string)
	updateText(strings)
	pass

func updateText(text):
	label.text = text

func _on_north_pressed() -> void:
	if current_room.exits.has("north"):
		changeRoom(current_room.exits["north"])

func _on_west_pressed() -> void:
	if current_room.exits.has("west"):
		changeRoom(current_room.exits["west"])

func _on_south_pressed() -> void:
	if current_room.exits.has("south"):
		changeRoom(current_room.exits["south"])

func _on_east_pressed() -> void:
	if current_room.exits.has("east"):
		changeRoom(current_room.exits["east"])
