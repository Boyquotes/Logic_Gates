extends Button

var pressd = false
var p
var area

func _ready():
	p = self.get_parent()
	area = Rect2(self.rect_position, self.rect_size)
	
func _input(event):
	if event is InputEventMouseButton:
		if pressd:
			if area.has_point(get_global_mouse_position()):
				print("()")
				for i in p.get_children():
					var nm = i.get_name()
					if not "input_board" in nm and not "output_board" in nm and not "remove_out" in nm and not "add_output" in nm and not "open_popup" in nm and not "remove_gate" in nm and not "gate_popup" in nm and not "Save" in nm:
						if Rect2(i.rect_position, i.rect_size).has_point(get_global_mouse_position()):
							p.remove_child(i)
			pressd = false
		else:
			pressd = true
