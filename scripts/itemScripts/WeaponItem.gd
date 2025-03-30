@tool
extends Resource
class_name WeaponData


enum WType {NONE, LONGSWORD, SHORTSWORD, AXE, BLUNT, POLEARM, UNARMED, BOW, CROSSBOW}
enum areashape {LINE, CIRCLE, CONE}
enum hands {lEFT, RIGHT, BOTH}
var Type = null
var MType = null
@export var name: String
@export_multiline var description: String
@export var texture: Texture2D
@export var Weapon_Type: WType

@export var accuracy = 0
@export var minDamage = 0
@export var maxDamage = 0
@export var reach = 0
@export var area = 0
@export var area_shape: areashape



func _process(_delta: float) -> void:
	pass
