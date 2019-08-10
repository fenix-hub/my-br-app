extends Control

onready var c_nome : LineEdit = $Container/Ricerca/nome
onready var c_cognome : LineEdit = $Container/Ricerca/cognome
onready var c_mail : LineEdit = $Container/Ricerca/telefono
onready var c_telefono :  LineEdit = $Container/Ricerca/mail


onready var ElencoClient  = $Container/Elenco/Elenco

var ClientButton = preload("res://scenes/Cliente.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	ElencoClienti.connect("nuovo_cliente",self,"aggiungi_cliente")
	ElencoClienti.connect("rimuovi_cliente",self,"elimina_cliente")
	for cl in ElencoClienti.elenco:
		aggiungi_cliente(cl)
	set_process(false)

func _process(delta):
	cerca_cliente()

func cerca_cliente() -> void:
	for cl in ElencoClient.get_children():
		if c_nome.text!="":
			if (c_nome.text.to_lower()) in str(cl.cliente.nome.to_lower()):
				cl.show()
			else:
				cl.hide()
		
		if c_cognome.text!="":
			if c_cognome.text.to_lower() in cl.cliente.cognome.to_lower():
				cl.show()
			else:
				cl.hide()
		
		if c_mail.text!="":
			if c_mail.text.to_lower() in cl.cliente.mail.to_lower():
				cl.show()
			else:
				cl.hide()
		
		if c_telefono.text!="":
			if (c_telefono.text.to_lower()) in cl.cliente.telefono.to_lower():
				cl.show()
			else:
				cl.hide()
		
		
		if c_nome.text=="" and c_cognome.text=="" and c_mail.text=="" and c_telefono.text=="":
			cl.show()

func aggiungi_cliente(cl) -> void :
	var cliente = ClientButton.instance()
	ElencoClient.add_child(cliente)
	cliente.aggiungi_cliente(cl.CODICE,cl.nome,cl.cognome,cl.telefono,cl.mail,cl.ragione_sociale,cl.indirizzo,cl.cap,cl.citta,cl.provincia,cl.piva,cl.allergie,cl.note,cl.prenotazioni)

func elimina_cliente(cl) -> void:
	print("cliente da rimuovere: ",cl)
	for client in ElencoClient.get_children():
		if client.cliente.CODICE == cl.CODICE:
			client.queue_free()

func _on_ElencoPanel_visibility_changed():
	set_process(visible)
