extends VBoxContainer
@onready var player = $"../../../../../../../../../../.."
@onready var this = $"."


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	#if !player.Inventory.is_empty():

	pass
	
func update_backpack():
	for i in get_children():
		i.queue_free()
	for item in player.Inventory:
		var item_name = item.get("name")
		var label_widget = Label.new()
		this.add_child(label_widget)
		label_widget.text = str(item_name)
