extends Node

#array contenente dizionari
var elenco : Array = []
var codici : Array = []
#forma della prenotazione
# {'tavolo':null,'orario':null,'cliente':null,'persone':null,'data':null,'note':null}
var save_file = "user://resources/files/elenco_prenotazioni.txt"

signal nuova_prenotazione(p)
signal rimuovi_prenotazione(p)

func _ready():
	carica_elenco()
	carica_codici()

func nuova_prenotazione(t : int , nome : String , cognome : String, persone : int , telefono : String, mail : String, giorno : int , mese : int, anno : int, ora : int , minuti : int, note : String) -> void:
	var codice : int
	if !elenco.empty() and !codici.empty():
		codici.sort()
		codice = codici[codici.size()-1] + 1
		codici.append(codice)
	else:
		codice = 0
		codici.append(codice)
	var pren : Dictionary = {'CODICE':codice,'tavolo':t,'nome':nome, 'cognome':cognome, 'persone':persone, 'telefono':telefono, 'mail':mail, 'giorno':giorno, 'mese':mese, 'anno':anno, 'ora':ora, 'minuti':minuti,'note':note}
	elenco.append(pren)
	emit_signal("nuova_prenotazione",pren)
	salva_elenco()

func rimuovi_prenotazione(codice : int) -> void:
	for pren in elenco:
		if pren.CODICE == codice:
			emit_signal("rimuovi_prenotazione",pren)
			elenco.erase(pren)
	salva_elenco()

func modifica_prenotazione(codice : int , t : int , nome : String , cognome : String, persone : int , telefono : String, mail : String, giorno : int , mese : int, anno : int, ora : int , minuti : int, note : String) -> void:
	nuova_prenotazione(t,nome, cognome, persone, telefono, mail, giorno, mese, anno, ora, minuti,note)
	rimuovi_prenotazione(codice)

func carica_codici() -> void:
	for pren in elenco:
		codici.append(pren.CODICE)

func carica_elenco() -> void:
	var file = File.new()
	if file.open(save_file, File.READ) != OK:
		file.open(save_file, File.WRITE)
		file.close()
		print("no save")
		return
	while not file.eof_reached(): 
		elenco.append(JSON.parse(file.get_line()).result)
	file.close()
	elenco.erase(null)

func salva_elenco():
	var file = File.new()
	file.open(save_file, File.WRITE) 
	for prenot in elenco:
		file.store_line(JSON.print(prenot))
	file.close()