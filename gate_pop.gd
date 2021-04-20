extends PopupMenu


func _on_add_gate_pressed():
	popup()
	var btn_tmp = load("res://add.tscn")
	var file = File.new()
	file.open("user://gates", File.READ)
	var data = []
	data = parse_json(file.get_line())
	for i in data:
		var new_btn = btn_tmp.instance()
		new_btn.set_name(i["name"])
		self.add_child(new_btn)
