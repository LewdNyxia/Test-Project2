extends Control

@onready var player = get_parent()
@onready var StatText = $MarginContainer/BoxContainer/VBoxContainer/HBoxContainer/MarginContainer/MarginContainer/tabbed/Stats/RichTextLabel
@onready var room_manager = $RoomManager
@onready var playfield = $"/root/Playfield"
@onready var label = $MarginContainer/BoxContainer/VBoxContainer/HBoxContainer/MarginContainer2/MarginContainer/MainTextPort
@onready var House = room_manager.get_child(0)
var statText
var itemlist = []

func _process(delta: float) -> void:
	player.pHP = player.pMHP
	statText ="[color=red]Health: " + str(player.pHP) +"/" + str(player.pMHP) + "[/color]" \
	+ "\nStrength: " + str(player.pSTR) + "\nAgility: " +str(player.pAGI) \
	+ "\nBody: " +str(player.pBOD) + "\nPersonality: " +str(player.pPER) \
	+ "\nIntelligence: " +str(player.pINT) + "\nSpeed: " +str(player.pSPE)
	StatText.text = statText


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
	for item in new_room.items:
		itemlist.append(item.get("name"))
	var items = PackedStringArray(itemlist)
	var strings = "You are now in: " +new_room.room_name + ". It is " +new_room.room_description + \
	"\nYou can go " + ",".join(exit_string) +\
	"\n Items in the room: " + ", ".join(items)
	updateText(strings)
	pass

func updateText(text):
	label.text = text
func addText(text):
	label.text += text


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
