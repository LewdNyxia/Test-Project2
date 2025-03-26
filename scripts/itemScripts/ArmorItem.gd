@tool
extends Resource
class_name ArmorData


enum Type {HEAD, CHEST, LLEG, RLEG, LFOOT, RFOOT, LARM, RARM, LHAND, RHAND, RING1, RING2, AMULET, CLOTHESTOP, CLOTHESBOTTOM, UNDERWEARTOP, UNDERWEARBOTTOM, WEAPON, SHIELD, MAGIC}
enum WType {NONE, LONGSWORD, SHORTSWORD, AXE, BLUNT, POLEARM, UNARMED, BOW, CROSSBOW}
enum MType {NONE, ELEMENTAL, CONJURATION, MUTATION, ALCHEMY, ENCHANTING}


@export var name: String
@export_multiline var description: String
@export var texture: Texture2D
@export var type: Type

@export var AC = 0
@export var DR = 0
@export var tier = 0


func _process(delta: float) -> void:
	pass
