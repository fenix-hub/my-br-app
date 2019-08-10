extends HBoxContainer
class_name PrenotazioneElimina

onready var Tavolo = $Dati/Dati/tavolo
onready var Ora = $Dati/Dati/ora
onready var Cliente = $Dati/Dati/cliente
onready var Persone = $Dati/Dati/persone
onready var Data = $Dati/Dati/data
onready var Note = $Dati/note

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

func _on_Elimina_pressed():
	ElencoPrenotazioni.rimuovi_prenotazione(prenotazione.CODICE)
	queue_free()
