extends Control

func _ready():
	pass # Replace with function body.

func _on_Button_pressed():
	accesso()

func _on_Password_gui_input(event):
	if Input.is_action_just_pressed("ui_accept"):
		accesso()

func accesso() -> void:
	var u : String = $VBoxContainer/User.get_text()
	var p : String = $VBoxContainer/Password.get_text()
	var elenco : Array = ElencoUtenti.utenti
	
	for ut in elenco:
		if ut.user == u and ut.password == p:
#			Utente.utente = elenco[ut].user
#			Utente.password = elenco[ut].password
#			Utente.staff = elenco[ut].staff
			User.utente = ut
			
			hide()
			get_node("../SideMenu/Bottoni/Pannello").pressed = true
			get_node("../Pannello").show()
			get_node("../Pannello").print_utente()
		else:
			User.utente = {}
