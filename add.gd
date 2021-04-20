extends Button



func _on_add_pressed():
	var my_nm = self.get_name()
	var p = self.get_parent().get_parent()
	var file = File.new()
	file.open("user://gates", File.READ)
	var data = []
	data = parse_json(file.get_line())
	var table
	for i in data:
		if my_nm == i["name"]:
			table = i["table"] 
			break
	var gate = load("res://gate.tscn").instance()
	var inputs = 0
	var i = 1
	while i != len(table):
		i = i * 2
		inputs += 1
		
	gate.output_table = table
	gate.num_inputs = inputs
	gate.num_outputs = len(table[0])
	p.add_child(gate)

