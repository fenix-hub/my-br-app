extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
var buttons : Array
# Called when the node enters the scene tree for the first time.
func _ready():
	for button in $BottomMenu.get_children():
		buttons.append(button)
	$ElencoPanel.show()
	change_button("Elenco")

func change_button(panelname : String) -> void:
	for button in buttons:
		if button.name != panelname:
			button.pressed = false
			get_node(button.name+"Panel").hide()
	get_node(panelname+"Panel").show()


func _on_Aggiungi_toggled(button_pressed):
	change_button("Aggiungi")


func _on_Elimina_toggled(button_pressed):
	change_button("Elimina")


func _on_Modifica_toggled(button_pressed):
	change_button("Modifica")


func _on_Elenco_toggled(button_pressed):
	change_button("Elenco")
