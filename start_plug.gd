extends Button

var icon_on = preload("res://start_plug_on.svg")
var icon_off = preload("res://start_plug_off.svg")
var on = false
var pos = null


func _on_plug_button_down():
	pos = get_viewport().get_mouse_position()


func _on_plug_button_up():
	if pos == get_viewport().get_mouse_position():
		on = false
		icon = icon_off

func _on_on_off_pressed():
	on = not on
	if on:
		icon = icon_on
	else:
		icon = icon_off
	print("start button je ", on)
