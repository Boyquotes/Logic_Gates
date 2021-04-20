extends ColorRect

var rect_color = "blue"
var txt = "and"
var txt_color = "white"
var plug = preload("res://plug.tscn")

#Has to be atleast one
var num_inputs = 2
var num_outputs = 1
var int_input
var spacing = null
var output_table = ["0", "0", "0", "1"]

var hoverd = false
var p = false
var following = false
var drag_adjustment

func _input(event):
	if event is InputEventMouseButton:
		if not p and hoverd:
			print("following")
			following = true
			drag_adjustment =  get_global_mouse_position() - self.rect_global_position
			print(drag_adjustment)

		if p:
			p = false
			following = false
		else:
			p = true

			
func bin2dec(bin):
	var count = pow(2, len(bin) - 1)
	var dec = 0
	for i in bin:
		dec += int(i) * count
		count = count / 2
	return dec
	

func _ready():

	if num_inputs > num_outputs:
		self.rect_size = Vector2(len(txt) * 10 + 60, 39 * num_inputs)

	else:
		self.rect_size = Vector2(len(txt) * 10 + 60, 39 * num_outputs)
	
	self.get_child(0).text = txt
	self.get_child(0).set_position(Vector2(self.rect_size.x / 2 - 12, self.rect_size.y / 2 - 12))
	
	for i in range(num_inputs):
		var new = plug.instance()
		new.set_name("input" + str(i))
		self.add_child(new)	
		
	for i in range(num_outputs):
		var new = plug.instance()
		new.set_name("output" + str(i))
		self.add_child(new)
	
	var in_spacing = self.rect_size.y / num_inputs
	var out_spacing = self.rect_size.y / num_outputs
	
	var x_in
	var x_out
	x_in = 0
	x_out = 0
	if num_inputs == num_outputs:
		pass
	elif num_inputs < num_outputs:
		x_in = self.rect_size.y / (num_inputs + 1) - 25
	elif num_inputs > num_outputs:
		x_out = self.rect_size.y / (num_outputs + 1) - 25
	
	for i in self.get_children():
		if "input" in i.get_name():
			i.set_position(Vector2(-25, x_in))
			x_in += in_spacing
		elif "output" in i.get_name():
			i.set_position(Vector2(self.rect_size.x - 20, x_out))
			x_out += out_spacing

func _process(delta):
	if following:
		self.set_global_position(get_global_mouse_position() - drag_adjustment)
	
	var inputs = ""
	for i in self.get_children():
		if "Label" in i.get_name():
			continue
		if "out" in i.get_name():
			break
		if i.on:
			inputs = "1" + inputs
		else:
			inputs = "0" + inputs
	int_input = bin2dec(inputs)
	
	for i in range(num_outputs):
		var j = self.get_child(num_inputs + i + 1)
		if output_table[int_input][i] == "1":
			j.on = true
		else:
			j.on = false
			

func _on_gate_mouse_entered():
	hoverd = true

func _on_gate_mouse_exited():
	hoverd = false
