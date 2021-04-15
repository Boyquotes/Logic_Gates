extends ColorRect

var start_template = load("res://start.tscn")
var num_inputs = 2

func _on_add_pressed():
	num_inputs += 1
	
	var new_start = start_template.instance()
	self.add_child(new_start)
	
	var spacing = self.rect_size.y / num_inputs
	var y_input = spacing
	
	for i in self.get_children():
		if "start" in i.get_name():
			i.set_position(Vector2(9.728, y_input))
			y_input += spacing
			
	
	print(new_start.get_name())
