@tool
extends Resource
class_name MagicData


enum MType {NONE, ELEMENTAL, CONJURATION, MUTATION, ALCHEMY, ENCHANTING}
enum hands {lEFT, RIGHT, BOTH}
var equip_slot = null
var WType = null

@export var name: String
@export_multiline var description: String
@export var texture: Texture2D
@export var Magic_Type: MType

@export var Magic_Difficulty = 0
@export var magnitude = 0


func _process(_delta: float) -> void:
	pass
