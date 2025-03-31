extends VBoxContainer
@onready var player = $"../../../../../../../../../../.."
var equipmentButtons: Array[EquipButton] = []


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for widget in get_tree().get_nodes_in_group("equipbutton"):
		equipmentButtons.append(widget)
	print(equipmentButtons)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func refreshEquipmentButtons() -> void:
	for equip_button in equipmentButtons:
		equip_button.updateDropdown();
