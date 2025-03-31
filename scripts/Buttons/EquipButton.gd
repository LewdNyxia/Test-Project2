class_name EquipButton
extends OptionButton


@export var item_slot: ArmorData.EEquipSlot
@export var weapon_slot: WeaponData.WType
@export var magic_slot: MagicData.MType
@export var UI: Node
var player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = UI.get_parent()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func updateDropdown() -> void:
	clear()
	for item in player.Inventory:
		if (item.equip_slot == item_slot):
			add_item(item.name)
	
	
