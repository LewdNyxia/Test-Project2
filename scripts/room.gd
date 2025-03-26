@tool
extends PanelContainer
class_name GameRoom

@onready var Main = get_node("/root/playfield/UI")
@export var room_name = "House":
	set( name ) :
		room_name = name
		$MarginContainer/Rows/RoomName.text = name
@export var room_description = "A house":
	set( desc ) :
		room_description = desc
		$MarginContainer/Rows/RoomDescription.text = desc
@onready var exits: Dictionary = {}
var items: Array = []
@export var weapons: Array = []
@export var armor: Array = []
@export var magic: Array = []

func connectExit(dir: String, room: GameRoom):
	match dir:
		"west":
			exits[dir] = room
			room.exits["east"] = self
		"east":
			exits[dir] = room
			room.exits["west"] = self
		"north":
			exits[dir] = room
			room.exits["south"] = self
		"south":
			exits[dir] = room
			room.exits["north"] = self
	pass
	
func add_weapon(weapon: WeaponData):
	items.append(weapon)
	pass
func add_magic(magic: MagicData):
	items.append(magic)
	pass
func add_armor(armor: ArmorData):
	items.append(armor)
	pass

func _process(delta: float) -> void:
	pass
	
func _ready() -> void:
	for i in weapons:
		add_weapon(load(i))
	for i in armor:
		add_armor(load(i))
	for i in magic:
		add_magic(load(i))
