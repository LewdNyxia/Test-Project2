extends PanelContainer
class_name GameRoom

@onready var Main = get_node("/root/playfield/UI")
@export var room_name = "House"
@export var room_description = "A house"
@export var room_idH = 0
@export var room_idV = 0

@onready var exits: Dictionary = {}

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

func _process(delta: float) -> void:
	pass
	
func _ready() -> void:
	pass
