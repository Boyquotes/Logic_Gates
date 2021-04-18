extends Button

var icon_on = preload("res://start_plug_on.svg")
var icon_off = preload("res://start_plug_off.svg")
var on = false
var pos = null
var selected = false
var button_area = Rect2(self.rect_position, self.rect_size)




func _input(event):
	
#connects this btn with the one wich was pulled towards it
	if event is InputEventMouseButton:
		if button_area.has_point(self.get_local_mouse_position()):
			for i in self.get_parent().get_parent().get_parent().get_children():
				var nm = i.get_name()
				if not "input_board" in nm and not "output_board" in nm and not "remove_out" in nm and not "add_output" in nm:
					for ii in i.get_children():
						if "input" in ii.get_name():
							if ii.selected:
								ii.link(self)


func _on_plug_button_down():
	selected = true

func _on_plug_button_up():
	selected = false

func _on_on_off_pressed():
	on = not on
	if on:
		icon = icon_on
	else:
		icon = icon_off
	print("start button je ", on)


