extends ColorRect



func _on_Save_pressed():
	var file = File.new()
	file.open("user://gates", File.READ_WRITE)
	
	var data = []
	# data = parse_json(file.get_line())
	var a = {
		name = "and",
		color = "red",
		table = ["0", "0", "0", "1"]
	}
	
	var d = {
		name = "or",
		color = "blue",
		table = ["0", "1", "1", "1"]
	}
	data.append(a)
	data.append(d)
	file.store_line(to_json(data))
	print("stored")
	


func _on_add_pressed():
	pass
