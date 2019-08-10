extends Control

onready var dati_cliente = get_tree().get_nodes_in_group("DatiCliente")

func _ready():
	pass # Replace with function body.

func registra_cliente(n : String, c : String , t: String, m : String, r : String , i: String, cap : String, citt : String, prov : String, piva : String ,  all : String, note : String) -> void:
	ElencoClienti.nuovo_cliente(n,c,t,m,r,i,cap,citt,prov,piva,all,note,0)

func svuota_campi() -> void:
	for campo in dati_cliente :
		campo.set_text("")

func _on_Svuota_pressed():
	svuota_campi()

func _on_Registra_pressed():
	var cl : Array = []
	for campo in dati_cliente:
		cl.append(campo.get_text())
	if cl[0]!= "" or cl[1]!= "" and cl[9]!= "" and cl[3]!= "" and cl[10]!= "" and cl[5]!= "" and cl[6]!= "" and cl[7]!= "" and cl[8]!= "":
		registra_cliente(cl[0],cl[1],cl[2],cl[3],cl[4],cl[5],cl[6],cl[7],cl[8],cl[9],cl[10],cl[11])
		svuota_campi()
	else:
		print("Mancano campi")
