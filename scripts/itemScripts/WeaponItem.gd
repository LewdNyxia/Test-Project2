@tool
extends Resource
class_name WeaponData


enum Type {HEAD, CHEST, LLEG, RLEG, LFOOT, RFOOT, LARM, RARM, LHAND, RHAND, RING1, RING2, AMULET, CLOTHESTOP, CLOTHESBOTTOM, UNDERWEARTOP, UNDERWEARBOTTOM, WEAPON, SHIELD, MAGIC}
enum WType {NONE, LONGSWORD, SHORTSWORD, AXE, BLUNT, POLEARM, UNARMED, BOW, CROSSBOW}
enum MType {NONE, ELEMENTAL, CONJURATION, MUTATION, ALCHEMY, ENCHANTING}


@export var name: String
@export_multiline var description: String
@export var texture: Texture2D
@export var Weapon_Type: WType

@export var accuracy = 0
@export var minDamage = 0
@export var maxDamage = 0
@export var reach = 0


func _process(delta: float) -> void:
	pass
