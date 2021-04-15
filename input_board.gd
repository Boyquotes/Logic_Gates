extends ColorRect

var start_template = load("res://start.tscn")
var num_inputs = 2

func reposition_buttons():
	var spacing = self.rect_size.y / num_inputs
	var y_input = spacing
	
	for i in self.get_children():
		if "start" in i.get_name():
			i.set_position(Vector2(9.728, y_input))
			y_input += spacing

func _on_add_pressed():
	num_inputs += 1
	
	var new_start = start_template.instance()
	self.add_child(new_start)
	reposition_buttons()
	
	print(new_start.get_name())


func _on_remove_pressed():
	if num_inputs > 1:
		self.remove_child(self.get_child(num_inputs))
		num_inputs -= 1
		reposition_buttons()
