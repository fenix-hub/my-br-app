extends Control

onready var dati_cliente = get_tree().get_nodes_in_group("ModificaDatiCliente")

var cliente

func _ready():
	hide()

func modifica_cliente(co, nome,cognome,telefono,mail,ragione_sociale,indirizzo,cap,citta,provincia,piva,allergie,note) -> void:
	ElencoClienti.modifica_cliente(co, nome,cognome,telefono,mail,ragione_sociale,indirizzo,cap,citta,provincia,piva,allergie,note,0)

func svuota_campi() -> void:
	for campo in dati_cliente :
		campo.set_text("")

func riempi_campi() -> void:
	var c
	for cl in ElencoClienti.elenco:
		if cl.CODICE == cliente.CODICE:
			c = cl
			break
	
	dati_cliente[0].text = c.nome
	dati_cliente[1].text = c.cognome
	dati_cliente[2].text = c.telefono
	dati_cliente[3].text = c.mail
	dati_cliente[4].text = c.ragione_sociale
	dati_cliente[5].text = c.indirizzo
	dati_cliente[6].text = c.cap
	dati_cliente[7].text = c.citta
	dati_cliente[8].text = c.provincia
	dati_cliente[9].text = c.piva
	dati_cliente[10].text = c.allergie
	dati_cliente[11].text = c.note

func _on_Registra_pressed():
	var clis : Array = []
	for campo in dati_cliente:
		clis.append(campo.get_text())
	if clis[0]!= "" or clis[1]!= "" and clis[9]!= "" and clis[3]!= "" and clis[10]!= "" and clis[5]!= "" and clis[6]!= "" and clis[7]!= "" and clis[8]!= "":
		modifica_cliente(cliente.CODICE, clis[0], clis[1],clis[2],clis[3],clis[4],clis[5],clis[6],clis[7],clis[8],clis[9],clis[10],clis[11])
		svuota_campi()
		hide()
	else:
		print("Mancano campi")


func _on_Svuota_pressed():
	svuota_campi()
	hide()
