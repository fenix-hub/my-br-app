extends Control

onready var Nome : Label = $Programma/Nome
onready var Vers : Label = $Programma/Versione

func _ready():
	Nome.set_text(" "+DatiProgramma.nome_ristorante+" - My Booking Restaurant")
	Vers.set_text("v"+DatiProgramma.versione+DatiProgramma.licenza.free)

func _on_Exit_pressed():
	get_tree().quit()

func _on_Minimize_pressed():
	OS.set_window_minimized(!OS.is_window_minimized())


