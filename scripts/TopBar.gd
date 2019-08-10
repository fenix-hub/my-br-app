extends Control


onready var Vers : Node = $Programma/Versione

func _ready():
	Vers.set_text("v"+DatiProgramma.versione+"F")

func _on_Exit_pressed():
	get_tree().quit()

func _on_Minimize_pressed():
	OS.set_window_minimized(!OS.is_window_minimized())


