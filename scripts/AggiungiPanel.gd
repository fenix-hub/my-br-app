extends Control

onready var dati_prenotazione = get_tree().get_nodes_in_group("DatiPrenotazione")

func _ready():
	pass # Replace with function body.

func registra_prenotazione(nome, cognome, persone, telefono, mail, giorno, mese, anno, ora, minuti,note) -> void:
	ElencoPrenotazioni.nuova_prenotazione(0, nome, cognome, persone, telefono, mail, giorno, mese, anno, ora, minuti,note)

func svuota_campi() -> void:
	for campo in dati_prenotazione :
		campo.set_text("")
	$Dati/DataOra/oggi.pressed = false
	_on_oggi_toggled(true)

func _on_Svuota_pressed():
	svuota_campi()

func _on_Registra_pressed():
	var prenot : Array = []
	for campo in dati_prenotazione:
		prenot.append(campo.get_text())
	if prenot[0]!= "" or prenot[1]!= "" and prenot[9]!= "" and prenot[3]!= "" and prenot[10]!= "" and prenot[5]!= "" and prenot[6]!= "" and prenot[7]!= "" and prenot[8]!= "":
		registra_prenotazione(prenot[0],prenot[1],int(prenot[2]),prenot[3],prenot[4],int(prenot[5]),int(prenot[6]),int(prenot[7]),int(prenot[8]),int(prenot[9]),prenot[10])
		svuota_campi()
	else:
		print("Mancano campi")


func _on_oggi_toggled(button_pressed):
	if $Dati/DataOra/oggi.pressed:
		dati_prenotazione[5].set_text(str(OS.get_date().day))
		dati_prenotazione[5].editable = false
		dati_prenotazione[6].set_text(str(OS.get_date().month))
		dati_prenotazione[6].editable = false
		dati_prenotazione[7].set_text(str(OS.get_date().year))
		dati_prenotazione[7].editable = false
	else:
		dati_prenotazione[5].set_text("")
		dati_prenotazione[5].editable = true
		dati_prenotazione[6].set_text("")
		dati_prenotazione[6].editable = true
		dati_prenotazione[7].set_text("")
		dati_prenotazione[7].editable = true
