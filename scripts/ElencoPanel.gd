extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var c_tavolo : LineEdit = $Container/Ricerca/tavolo
onready var c_orario : LineEdit = $Container/Ricerca/orario
onready var c_cliente : LineEdit = $Container/Ricerca/cliente
onready var c_persone :  LineEdit = $Container/Ricerca/persone
onready var c_data : LineEdit = $Container/Ricerca/data

onready var ElencoPrenot  = $Container/Elenco/Elenco

var PrenotButton = preload("res://scenes/Prenotazione.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	ElencoPrenotazioni.connect("nuova_prenotazione",self,"aggiungi_prenotazione")
	ElencoPrenotazioni.connect("rimuovi_prenotazione",self,"elimina_prenotazione")
	for prenot in ElencoPrenotazioni.elenco:
		aggiungi_prenotazione(prenot)
	set_process(false)

func _process(delta):
	cerca_prenotazione()

func cerca_prenotazione() -> void:
	for prenot in ElencoPrenot.get_children():
		if c_tavolo.text!="":
			if (c_tavolo.text) in str(prenot.prenotazione.tavolo):
				prenot.show()
			else:
				prenot.hide()
		
		if c_orario.text!="":
			if c_orario.text.to_lower() in prenot.prenotazione.orario.to_lower():
				prenot.show()
			else:
				prenot.hide()
		
		if c_cliente.text!="":
			if c_cliente.text.to_lower() in prenot.prenotazione.cliente.to_lower():
				prenot.show()
			else:
				prenot.hide()
		
		if c_persone.text!="":
			if (c_persone.text) in str(prenot.prenotazione.persone):
				prenot.show()
			else:
				prenot.hide()
		
		if c_data.text!="":
			if c_data.text.to_lower() in prenot.prenotazione.data.to_lower():
				prenot.show()
			else:
				prenot.hide()
		
		if c_data.text=="" and c_persone.text=="" and c_cliente.text=="" and c_orario.text=="" and c_tavolo.text=="":
			prenot.show()

func aggiungi_prenotazione(p) -> void :
	var prenotazione = PrenotButton.instance()
	ElencoPrenot.add_child(prenotazione)
	if p.tavolo!=0:
		prenotazione.aggiungi_prenotazione(p.tavolo,str(p.ora)+":"+str(p.minuti),str(p.nome)+" "+str(p.cognome),p.persone,str(p.giorno)+"-"+str(p.mese)+"-"+str(p.anno),p.note,p.CODICE)
	else:
		prenotazione.aggiungi_prenotazione(0,str(p.ora)+":"+str(p.minuti),str(p.nome)+" "+str(p.cognome),p.persone,str(p.giorno)+"-"+str(p.mese)+"-"+str(p.anno),p.note,p.CODICE)

func elimina_prenotazione(p) -> void:
	for pren in ElencoPrenot.get_children():
		if pren.prenotazione.CODICE == p.CODICE:
			pren.queue_free()


func _on_ElencoPanel_visibility_changed():
	set_process(visible)
