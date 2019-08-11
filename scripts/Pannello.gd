extends Control


var buttons : Array

func _ready():
	for button in $Bottoni.get_children():
		if button is Button:
			buttons.append(button)

func change_panel(panelname : String) -> void:
	for button in buttons:
		if button.name != panelname:
			button.pressed = false
			get_node("../"+button.name).hide()
	get_node("../"+panelname).show()

func _on_Prenotazioni_toggled(button_pressed):
	change_panel("Prenotazioni")
	get_node("../Prenotazioni/BottomMenu/Elenco").pressed = true

func _on_Tavoli_toggled(button_pressed):
	change_panel("Tavoli")

func _on_Clienti_toggled(button_pressed):
	change_panel("Clienti")
	get_node("../Clienti/BottomMenu/Elenco").pressed = true

func _on_Materiali_toggled(button_pressed):
	change_panel("Materiali")

func _on_Pannello_toggled(button_pressed):
	change_panel("Pannello")

func _on_Staff_toggled(button_pressed):
	change_panel("Staff")

func _on_Stats_toggled(button_pressed):
	change_panel("Stats")

func _on_Impostazioni_toggled(button_pressed):
	change_panel("Impostazioni")
