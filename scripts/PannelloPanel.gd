extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var Utente = $Dati/Utente/Utente
onready var Staff = $Dati/Staff/Utente

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func print_utente():
	Utente.set_text(User.utente.user)
	Staff.set_text(User.utente.staff)

func _on_CambiaUtente_pressed():
	User.utente = {}
	get_node("../Accesso").show()
