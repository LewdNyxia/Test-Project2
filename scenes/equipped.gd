extends VBoxContainer
@onready var player = $"../../../../../../../../../../.."
var equipmentButtons = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var a = get_tree().get_nodes_in_group("equipbutton")
	for i in a:
		equipmentButtons.append(i.get_name())
	print(equipmentButtons)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	for item in player.Inventory:
		if item.Type != null:
			for i in equipmentButtons:
				var buttonname = equipmentButtons.get(i)
				if buttonname == "&"+item.Type + "Option":
					pass
		if item.WType != null:
			for type in equipmentButtons:
				if equipmentButtons.get(type) == item.WType:
					equipmentButtons.get(type).add_item(item)
	pass
