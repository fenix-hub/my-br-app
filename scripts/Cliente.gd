extends Button
class_name Cliente

onready var ClienteD = $Cliente
onready var Nome = $Cliente/Dati/nome
onready var Cognome = $Cliente/Dati/cognome
onready var Telefono = $Cliente/Dati/telefono
onready var Mail = $Cliente/Dati/mail
onready var Prenotazioni = $Cliente/Dati/pren
onready var Indirizzo = $Cliente/Dati2/indirizzo
onready var Cap = $Cliente/Dati2/cap
onready var Citta = $Cliente/Dati2/citta
onready var Prov = $Cliente/Dati2/prov
onready var Ragione = $Cliente/Dati3/ragione
onready var Piva = $Cliente/Dati3/piva
onready var Allergie = $Cliente/allergie
onready var Note = $Cliente/note

# esportati per renderli accessibili dall'esterno
var cliente : Dictionary = {'CODICE':null,'nome':null,'cognome':null,'telefono':null,'mail':null,'ragione_sociale':null,'indirizzo':null,'cap':null,'citta':null,'provincia':null,'piva':null, 'allergie':null, 'note':null, 'prenotazioni':null}


func _ready():
	rect_min_size.y = 30

func aggiungi_cliente(codice: int, n : String, c : String , t: String, m : String, r : String , i: String, cap : String, citt : String, prov : String, piva : String ,  all : String, note : String, prenot : int) -> void:
	Nome.set_text(n)
	Cognome.set_text(c)
	Telefono.set_text(t)
	Mail.set_text(m)
	Indirizzo.set_text(i)
	Cap.set_text(cap)
	Citta.set_text(citt)
	Prov.set_text(cap)
	Ragione.set_text("Ragione Sociale: "+r)
	Piva.set_text("P.iva: "+piva)
	Allergie.set_text("Allergie: "+all)
	Note.set_text("Note: "+note)
	Prenotazioni.set_text(String(prenot))
	
	cliente.CODICE=codice
	cliente.nome=n
	cliente.cognome=c
	cliente.telefono=t
	cliente.mail=m
	cliente.indirizzo=i
	cliente.cap=cap
	cliente.citta=citt
	cliente.provincia=prov
	cliente.ragione_sociale=r
	cliente.piva=piva
	cliente.allergie=all
	cliente.note=note
	cliente.prenotazioni=prenot

func _on_Prenotazione_pressed():
	if rect_min_size.y == 30:
		rect_min_size.y = ClienteD.rect_size.y
		$Cliente/Dati/tab.flip_v = true
	else:
		rect_min_size.y = 30
		$Cliente/Dati/tab.flip_v = false
