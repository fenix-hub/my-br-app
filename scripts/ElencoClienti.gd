extends Node


var elenco : Array = []
var codici : Array = []
#forma cliente {'nome':null,'cognome':null,'ragione_sociale':null,'indirizzo':null,'cap':null,'citta':null,'provincia':null,'piva':null,'telefono':null,'mail':null}

var save_file = "res://resources/files/elenco_clienti.txt"

signal nuovo_cliente(c)
signal rimuovi_cliente(c)

func _ready():
	carica_elenco() 
	carica_codici() 

func nuovo_cliente(n : String, c : String , t: String, m : String, r : String , i: String, cap : String, citt : String, prov : String, piva : String ,  all : String, note : String, prenot : int) -> void:
	var codice : int
	if !elenco.empty() and !codici.empty():
		codici.sort()
		codice = codici[codici.size()-1] + 1
		codici.append(codice)
	else:
		codice = 0
		codici.append(codice)
	
	if !elenco.empty():
		for cl in elenco:
			if cl.nome.to_lower() == n.to_lower() and cl.cognome.to_lower() == c.to_lower():
				prenot += cl.prenotazioni
				break
	
	var cliente : Dictionary = {'CODICE':codice,'nome':n,'cognome':c,'telefono':t,'mail':m,'ragione_sociale':r,'indirizzo':i,'cap':cap,'citta':citt,'provincia':prov,'piva':piva, 'allergie':all, 'note':note , 'prenotazioni':prenot}
	elenco.append(cliente)
	emit_signal("nuovo_cliente",cliente)
	salva_elenco()

func rimuovi_cliente(codice : int) -> void:
	for cl in elenco:
		if cl.CODICE == codice:
			emit_signal("rimuovi_cliente",cl)
			elenco.erase(cl)
#	else:
#		for cl in elenco:
#			if cl.nome.to_lower() == cli.nome.to_lower() and  cl.cognome.to_lower() == cli.cognome.to_lower():
#				emit_signal("rimuovi_cliente",cl)
#				elenco.erase(cl)
	salva_elenco()

func modifica_cliente(codice : int, n : String, c : String , t: String, m : String, r : String , i: String, cap : String, citt : String, prov : String, piva : String ,  all : String, note : String, prenot : int) -> void:
	nuovo_cliente(n,c,t,m,r,i,cap,citt,prov,piva,all,note,prenot)
	rimuovi_cliente(codice)

func carica_codici() -> void:
	for cl in elenco:
		codici.append(cl.CODICE)

func carica_elenco() -> void:
	var file = File.new()
	if file.open(save_file, File.READ) != OK:
		print("no save")
		file.open(save_file, File.WRITE)
		file.close()
		return
	while not file.eof_reached(): 
		elenco.append(JSON.parse(file.get_line()).result)
	file.close()
	elenco.erase(null)

func salva_elenco():
	var file = File.new()
	file.open(save_file, File.WRITE) 
	for cl in elenco:
		file.store_line(JSON.print(cl))
	file.close()

