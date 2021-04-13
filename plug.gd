extends Button

var icon_on = preload("res://plug_on.svg")
var icon_off = preload("res://plug_off.svg")

var pos = null

var on = false
var selected = false
var button_area = Rect2(self.rect_position, self.rect_size)
var lead = null



func _input(event):
	if event is InputEventMouseButton:
		if button_area.has_point(self.get_local_mouse_position()):
			var board = self.get_parent()
			for i in board.get_child(0).get_children():
				for ii in i.get_children():
					if "plug" in ii.get_name():
						if ii.selected:
							print("we got him")

func _on_plug_button_down():
	pos = get_viewport().get_mouse_position()
	selected = true


func link(name):
	print(name.on)
	lead = name


func _on_plug_button_up():
	if pos == get_viewport().get_mouse_position():
		on = false
		icon = icon_off
	selected = false

