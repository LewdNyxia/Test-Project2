@tool
extends Resource
class_name ArmorData


enum EEquipSlot {HEAD, CHEST, LEGS, BOOTS, ARMS, GLOVES, RING1, RING2, AMULET, SHIRT, PANTS, BRA, UNDERWEAR, WEAPON}

var WType = null
var MType = null

@export var name: String
@export_multiline var description: String
@export var texture: Texture2D
@export var equip_slot: EEquipSlot

@export var AC = 0
@export var DR = 0
@export var tier = 0


func _process(_delta: float) -> void:
	pass
