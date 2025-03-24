extends PanelContainer
@onready var Main = get_node("/root/playfield/UI")
@export var room_name = "House"
@export var room_description = "A house"
@export var room_idH = 0
@export var room_idV = 0
@export var exitN = 0
@export var exitS = 0
@export var exitE = 0
@export var exitW = 0

func _process(delta: float) -> void:
	Main.RoomData(room_idH, room_idV, exitN, exitS, exitE, exitW, room_name, room_description)
