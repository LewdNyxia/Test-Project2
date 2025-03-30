extends Control

@onready var player = get_parent()
@onready var StatText = $MarginContainer/BoxContainer/VBoxContainer/HBoxContainer/MarginContainer/VBoxContainer/MarginContainer/tabbed/Stats/RichTextLabel
@onready var room_manager = $RoomManager
@onready var playfield = $"../"
@onready var labeL = $MarginContainer/BoxContainer/VBoxContainer/HBoxContainer/MarginContainer2/MarginContainer/MainTextPort
@onready var House = room_manager.get_child(0)
@onready var ItemPanel = $"MarginContainer/BoxContainer/VBoxContainer/HBoxContainer/MarginContainer3/MarginContainer/TabContainer/Room Contents/Items"
@onready var CharacterPanel = $"MarginContainer/BoxContainer/VBoxContainer/HBoxContainer/MarginContainer3/MarginContainer/TabContainer/Room Contents/Characters"
@onready var backpack = $MarginContainer/BoxContainer/VBoxContainer/HBoxContainer/MarginContainer/VBoxContainer/MarginContainer/tabbed/Inventory/Backpack
var statText
var itemlist = []

func _process(_delta: float) -> void:
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
	var i = 0
	for a in itemlist:
		ItemPanel.get_child(i).queue_free()
		ItemPanel.get_child(i+1).queue_free()
		i += 2
	itemlist.clear()
	i = 0
	for item in new_room.items:
		var item_name = item.get("name")
		itemlist.append(item_name)
		var label_widget = Label.new()
		ItemPanel.add_child(label_widget)
		label_widget.text = str(item_name)
		var button_widget = InventoryButton.new()
		ItemPanel.add_child(button_widget)
		button_widget.text = "Take item?"
		button_widget.item_name = str(item_name)
		button_widget.button_down.connect(_button_clicked.bind(item_name, item))
		i += 2
			

	var items = PackedStringArray(itemlist)
	var strings = "You are now in: " +new_room.room_name + ". It is " +new_room.room_description + \
	"\nYou can go " + ",".join(exit_string) +\
	"\n Items in the room: " + ", ".join(items)
	updateText(strings)
	
	pass
	
func _button_clicked(item_name, item):
	player.Inventory.append(item)
	var index = findItem(item_name)
	if index != -1:
		itemlist.remove_at(index)
		var label = findLabel(item_name)
		if label:
			label.queue_free()
		var button = findInventoryButton(item_name)
		if button:
			button.queue_free()
	else:
		print("Could not find Item")
	print(player.Inventory)
	backpack.update_backpack()

func findItem(in_item) -> int:
	var i = -1
	for item in itemlist:
		i += 1
		if item == in_item:
			return i
	return i

# might be able to get away with combining FindLabel and FindInventoryButton but :shrug:
func findLabel(in_name):
	for widget in ItemPanel.get_children():
		if  widget is Label:
			if widget.text == in_name:
				return widget
	
	return null
	
	
func findInventoryButton(in_item):
	for widget in ItemPanel.get_children():
		if  widget is InventoryButton:
			if widget.item_name == in_item:
				return widget
	
	return null



func updateText(text):
	labeL.text = text
func addText(text):
	labeL.text += text


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
