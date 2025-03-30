extends Control
var ATTpoints = 6
@onready var pointlabel = $MarginContainer2/BoxContainer/VBoxContainer/HBoxContainer/MarginContainer3/TabContainer/Attributes/VBoxContainer/Points/Label2
@onready var player = get_parent()
@onready var MainText = $MarginContainer2/BoxContainer/VBoxContainer/HBoxContainer/MarginContainer2/MarginContainer/MainTextPort
@onready var StatText = $MarginContainer2/BoxContainer/VBoxContainer/HBoxContainer/MarginContainer/MarginContainer/tabbed/Stats/RichTextLabel
@onready var this = $"."
@onready var Main = $"../UI"
var statText
var red = Color(1.0,0.0,0.0,1.0)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	MainText.text = "Pick your attributes!"
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pointlabel.text = str(ATTpoints)
	player.pHP = player.pMHP
	statText ="[color=red]Health: " + str(player.pHP) +"/" + str(player.pMHP) + "[/color]" \
	+ "\nStrength: " + str(player.pSTR) + "\nAgility: " +str(player.pAGI) \
	+ "\nBody: " +str(player.pBOD) + "\nPersonality: " +str(player.pPER) \
	+ "\nIntelligence: " +str(player.pINT) + "\nSpeed: " +str(player.pSPE)
	StatText.text = statText
	
	
	pass





func _on_str_button_pressed() -> void:
	if ATTpoints > 0:
		player.changeAttribute("pSTR", 1)
		ATTpoints -= 1
	else:
		MainText.text += "\nOut of Points!"
	pass # Replace with function body.
func _on_negstr_pressed() -> void:
	if player.pSTR > 0:
		player.changeAttribute("pSTR", -1)
		ATTpoints += 1
	else:
		MainText.text += "\nCan't go negative!"
	pass # Replace with function body.

func _on_agi_button_pressed() -> void:
	if ATTpoints > 0:
		player.changeAttribute("pAGI", 1)
		ATTpoints -= 1
	else:
		MainText.text += "\nOut of Points!"
	pass # Replace with function body.
func _on_negagi_pressed() -> void:
	if player.pAGI > 0:
		player.changeAttribute("pAGI", -1)
		ATTpoints += 1
	else:
		MainText.text += "\nCan't go negative!"
	pass # Replace with function body.

func _on_bod_button_pressed() -> void:
	if ATTpoints > 0:
		player.changeAttribute("pBOD", 1)
		ATTpoints -= 1
	else:
		MainText.text += "\nOut of Points!"
	pass # Replace with function body.
func _on_negbod_pressed() -> void:
	if player.pBOD > 0:
		player.changeAttribute("pBOD", -1)
		ATTpoints += 1
	else:
		MainText.text += "\nCan't go negative!"
	pass # Replace with function body.

func _on_per_button_pressed() -> void:
	if ATTpoints > 0:
		player.changeAttribute("pPER", 1)
		ATTpoints -= 1
	else:
		MainText.text += "\nOut of Points!"
	pass # Replace with function body.
func _on_negper_pressed() -> void:
	if player.pPER > 0:
		player.changeAttribute("pPER", -1)
		ATTpoints += 1
	else:
		MainText.text += "\nCan't go negative!"
	pass # Replace with function body.

func _on_int_button_pressed() -> void:
	if ATTpoints > 0:
		player.changeAttribute("pINT", 1)
		ATTpoints -= 1
	else:
		MainText.text += "\nOut of Points!"
	pass # Replace with function body.
func _on_negint_pressed() -> void:
	if player.pINT > 0:
		player.changeAttribute("pINT", -1)
		ATTpoints += 1
	else:
		MainText.text += "\nCan't go negative!"
	pass # Replace with function body.

func _on_spe_button_pressed() -> void:
	if ATTpoints > 0:
		player.changeAttribute("pSPE", 1)
		ATTpoints -= 1
	else:
		MainText.text += "\nOut of Points!"
	pass # Replace with function body.
func _on_negspe_pressed() -> void:
	if player.pSPE > 0:
		player.changeAttribute("pSPE", -1)
		ATTpoints += 1
	else:
		MainText.text += "\nCan't go negative!"
	pass # Replace with function body.


func _on_button_pressed() -> void:
	if ATTpoints == 0:
		this.set_visible(false)
		Main.set_visible(true)
	else:
		MainText.text += "\n[color=red]Spend your points first![/color]"
	pass # Replace with function body.
