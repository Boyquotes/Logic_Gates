extends Button

var icon_on = preload("res://plug_on.svg")
var icon_off = preload("res://plug_off.svg")
var on = true
var pos = null
var selected = false

var lead = null
var hovered = false
var p = false

func _process(delta):
	pass

	  
		
func _on_plug_button_down():
	pos = get_viewport().get_mouse_position()
	selected = true


func _on_plug_button_up():
	if pos == get_viewport().get_mouse_position():
		on = false
		icon = icon_off
	selected = false

