extends Control

onready var dati_prenotazione = get_tree().get_nodes_in_group("DatiModificaPrenotazione")

var prenotaz

func _ready():
	pass # Replace with function body.

func modifica_prenotazione(co, tv, nome, cognome, persone, telefono, mail, giorno, mese, anno, ora, minuti,note) -> void:
	ElencoPrenotazioni.modifica_prenotazione(co, tv, nome, cognome, persone, telefono, mail, giorno, mese, anno, ora, minuti,note)

func registra_cliente_daprenot(nome, cognome, telefono, mail) -> void:
	var nuovo = false
	if !ElencoClienti.elenco.empty():
		for cl in ElencoClienti.elenco:
			if cl.nome.to_lower() == nome.to_lower() and cl.cognome.to_lower() == cognome.to_lower():
				ElencoClienti.modifica_cliente(cl.CODICE,cl.nome,cl.cognome,cl.telefono,cl.mail,cl.ragione_sociale,cl.indirizzo,cl.cap,cl.citta,cl.provincia,cl.piva,cl.allergie,cl.note,0)
				nuovo = false
				break
			else:
				nuovo = true
	else:
		ElencoClienti.nuovo_cliente(nome,cognome,telefono,mail,"","","","","","","","",1)
	if nuovo:
		ElencoClienti.nuovo_cliente(nome,cognome,telefono,mail,"","","","","","","","",1)

func svuota_campi() -> void:
	for campo in dati_prenotazione :
		campo.set_text("")

func _on_Annulla_pressed():
	svuota_campi()
	hide()

func riempi_campi() -> void:
	var p
	for pren in ElencoPrenotazioni.elenco:
		if pren.CODICE == prenotaz.CODICE:
			p = pren
			break
	
	dati_prenotazione[0].text = p.nome
	dati_prenotazione[1].text = p.cognome
	dati_prenotazione[2].text = str(p.persone)
	dati_prenotazione[3].text = p.telefono
	dati_prenotazione[4].text = p.mail
	dati_prenotazione[5].text = str(p.giorno)
	dati_prenotazione[6].text = str(p.mese)
	dati_prenotazione[7].text = str(p.anno)
	dati_prenotazione[8].text = str(p.ora)
	dati_prenotazione[9].text = str(p.minuti)
	dati_prenotazione[10].text = p.note

func _on_Modifica_pressed():
	var prenot : Array = []
	for campo in dati_prenotazione:
		prenot.append(campo.get_text())
	print(prenot)
	if prenot[0]!= "" or prenot[1]!= "" and prenot[9]!= "" and prenot[3]!= "" and prenot[10]!= "" and prenot[5]!= "" and prenot[6]!= "" and prenot[7]!= "" and prenot[8]!= "":
		modifica_prenotazione(prenotaz.CODICE, prenotaz.tavolo, prenot[0], prenot[1],int(prenot[2]),prenot[3],prenot[4],int(prenot[5]),int(prenot[6]),int(prenot[7]),int(prenot[8]),int(prenot[9]),prenot[10])
		registra_cliente_daprenot(prenot[0],prenot[1],prenot[2],prenot[3])
		svuota_campi()
		hide()
	else:
		print("Mancano campi")
	
