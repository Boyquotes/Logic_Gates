extends ColorRect



func _on_Save_pressed():
	var file = File.new
	file.open("user://gates", File.READ_WRITE)
	
	var data = []
	data = parse_json(file.get_line())
	var d = {
		name = "or",
		color = "blue",
		table = ["0", "1", "1", "1"]
	}
	data.append(d)
	


func _on_add_pressed():
	pass
