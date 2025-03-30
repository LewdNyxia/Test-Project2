extends Node
var itemsList = [
	"res://resource/items/Weapons/IronLongSword.tres",
	"res://resource/items/Weapons/IronDagger.tres"
]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$House.connectExit("east", $Outside)
	#$House.add_weapon(load(itemsList.get(0)))
	#$House.add_weapon(load(itemsList.get(1)))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
