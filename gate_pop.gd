extends PopupMenu

func _ready():
	var btn_tmp = load("res://add.tscn")
	var file = File.new()
	file.open("user://gates", File.READ)
	var data = []
	data = parse_json(file.get_line())
	var y = 0
	for i in data:
		print("== ", i)
		var new_btn = btn_tmp.instance()
		new_btn.set_name(i["name"])
		new_btn.set_position(Vector2(0, y))
		self.add_child(new_btn)
		y  += 100
		
func _on_add_gate_pressed():
	popup()
	
