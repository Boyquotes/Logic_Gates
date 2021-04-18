extends ColorRect

var num_outputs = 1
var output_template = load("res://plug.tscn")

func reposition_buttons():
	var spacing = self.rect_size.y / num_outputs
	var y_input = spacing
	
	for i in self.get_children():
		print(i.get_name())
		if "plug" in i.get_name():
			i.set_position(Vector2(0, y_input))
			y_input += spacing

func _on_add_output_pressed():
	num_outputs += 1
	
	var new_output = output_template.instance()
	self.add_child(new_output)
	reposition_buttons()
	
	print(new_output.get_name())


func _on_remove_output_pressed():
		if num_outputs > 1:
			print(self.get_child(num_outputs - 2).get_name())
			self.remove_child(self.get_child(num_outputs - 2))

			num_outputs -= 1
			reposition_buttons()
