extends Control

@onready var player = get_parent()
@onready var StatText = $MarginContainer/BoxContainer/VBoxContainer/HBoxContainer/MarginContainer/MarginContainer/tabbed/Stats/RichTextLabel
@onready var room_manager = $RoomManager
@onready var playfield = $"/root/Playfield"
@onready var label = $MarginContainer/BoxContainer/VBoxContainer/HBoxContainer/MarginContainer2/MarginContainer/MainTextPort
@onready var House = room_manager.get_child(0)
@onready var ItemPanel = $MarginContainer/BoxContainer/VBoxContainer/HBoxContainer/MarginContainer3/MarginContainer/TabContainer/Items
@onready var CharacterPanel = $MarginContainer/BoxContainer/VBoxContainer/HBoxContainer/MarginContainer3/MarginContainer/TabContainer/Characters
var statText
var itemlist = []
var i: int = 0
var i2: int = 1
var i3: int = -1

func _process(delta: float) -> void:
	player.pHP = player.pMHP
	statText ="[color=red]Health: " + str(player.pHP) +"/" + str(player.pMHP) + "[/color]" \
	+ "\nStrength: " + str(player.pSTR) + "\nAgility: " +str(player.pAGI) \
	+ "\nBody: " +str(player.pBOD) + "\nPersonality: " +str(player.pPER) \
	+ "\nIntelligence: " +str(player.pINT) + "\nSpeed: " +str(player.pSPE)
	StatText.text = statText
	
#	if ItemPanel.get_node("0").pressed:
#		print("AAA")


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
	i = 0
	i2 = 1
	for a in itemlist:
		ItemPanel.get_child(i).queue_free()
		ItemPanel.get_child(i2).queue_free()
		i += 2
		i2 += 2
	itemlist.clear()
	i = 0
	i2 = 1
	i3 = -1
	for item in new_room.items:
		i3 += 1
		itemlist.append(item.get("name"))
		ItemPanel.add_child(Label.new())
		ItemPanel.add_child(Button.new())
		if ItemPanel.get_child(i) is Label:
			ItemPanel.get_child(i).text = str(itemlist.get(i3))
			i += 2
		if ItemPanel.get_child(i2) is Button:
			ItemPanel.get_child(i2).text = "Take item?"
			ItemPanel.get_child(i2).name = str(i3)
			print(ItemPanel.get_child(i2).name)
			i2 += 2
			

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
	else:
		addText("\nYou cannot go that way.")

func _on_west_pressed() -> void:
	if current_room.exits.has("west"):
		changeRoom(current_room.exits["west"])
	else:
		addText("\nYou cannot go that way.")

func _on_south_pressed() -> void:
	if current_room.exits.has("south"):
		changeRoom(current_room.exits["south"])
	else:
		addText("\nYou cannot go that way.")

func _on_east_pressed() -> void:
	if current_room.exits.has("east"):
		changeRoom(current_room.exits["east"])
	else:
		addText("\nYou cannot go that way.")
