extends Control

var drag_point = null


func _ready():
	OS.window_position = OS.get_screen_size()/2 - OS.window_size/2
	
	$Accesso.show()
	$SideMenu.show()
	
	$Pannello.show()
	
	$Prenotazioni.hide()
	$Tavoli.hide()
	$Clienti.hide()
	$Materiali.hide()
	$Staff.hide()

func _on_TopBar_gui_input(event):
	if event is InputEventMouseButton :
		if event.pressed:
			drag_point = get_local_mouse_position()
		else:
			drag_point = null

func _process(delta):
	if drag_point!=null:
		OS.window_position = OS.window_position + get_global_mouse_position() - drag_point
