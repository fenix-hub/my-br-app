extends Button
class_name Prenotazione

onready var PrenotazioneD = $Prenotazione
onready var Tavolo = $Prenotazione/Dati/tavolo
onready var Ora = $Prenotazione/Dati/ora
onready var Cliente = $Prenotazione/Dati/cliente
onready var Persone = $Prenotazione/Dati/persone
onready var Data = $Prenotazione/Dati/data
onready var Note = $Prenotazione/note

# esportati per renderli accessibili dall'esterno
var prenotazione : Dictionary = {'tavolo':null,'orario':null,'cliente':null,'persone':null,'data':null,'note':null,'CODICE':null}
#var tavolo_p : int
#var orario_p : String
#var cliente_p : String
#var persone_p : int
#var data_p : String
#var note_p : String

func _ready():
	aggiungi_prenotazione(000,"99:99","Marco Antonio",100,"31-31-2019","alcune note", 999)
	rect_min_size.y = 30

func aggiungi_prenotazione(t : int , o : String, c : String , p : int , d : String, n : String, codice : int) -> void:
	Tavolo.set_text(str(t))
	Ora.set_text(o)
	Cliente.set_text(c)
	Persone.set_text(str(p))
	Data.set_text(d)
	Note.set_text("*"+n)
	
	prenotazione.tavolo = t
	prenotazione.orario = o
	prenotazione.cliente = c
	prenotazione.persone = p
	prenotazione.data = d
	prenotazione.note = n
	prenotazione.CODICE = codice

func _on_Prenotazione_pressed():
	if rect_min_size.y == 30:
		rect_min_size.y = PrenotazioneD.rect_size.y
		$Prenotazione/Dati/tab.flip_v = true
	else:
		rect_min_size.y = 30
		$Prenotazione/Dati/tab.flip_v = false
