extends Button

var icon_on = preload("res://start_plug_on.svg")
var icon_off = preload("res://start_plug_off.svg")
var on = false
var pos = null
var selected = false
var button_area = Rect2(self.rect_position, self.rect_size)

var hovered = false
var p = false

func _input(event):
	if event is InputEventMouseButton:
		if button_area.has_point(self.get_local_mouse_position()):
			for i in self.get_parent().get_parent().get_parent().get_children():
				if "plug" in i.get_name():
					if i.selected:
						print("we got a nice")

			

func _on_plug_button_down():
	pos = get_viewport().get_mouse_position()
	selected = true

func _on_plug_button_up():
	if pos == get_viewport().get_mouse_position():
		on = false
		icon = icon_off
	selected = false

func _on_on_off_pressed():
	on = not on
	if on:
		icon = icon_on
	else:
		icon = icon_off
	print("start button je ", on)


