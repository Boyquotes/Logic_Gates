extends ColorRect

var tb
var length
var laps = 0
var plugs
var pressed = false
var input_board
var output_board

func _ready():
	input_board = self.get_child(0)
	output_board = self.get_child(1)

func _process(delta):

	if pressed:
		if laps == 0:
			length = self.get_child(1).get_child_count()
			tb = []
			plugs = []
			print(input_board.get_name())
			for i in range(input_board.get_child_count() - 2):
				if input_board.get_child(i + 2).get_child(1).on:
					input_board.get_child(i + 2).get_child(1)._on_on_off_pressed()
				plugs.append(input_board.get_child(i + 2).get_child(1))
			laps += 1
			return
		laps += 1
		
		if not laps >= pow(2, len(plugs)) + 1:
			var tmp = ""
			for i in output_board.get_children():
				print(i.get_name())
				if i.on:
					tmp += "1"
				else:
					tmp += ("0")
			tb.append(tmp)
			
			for i in range(len(plugs)):
				if not plugs[i].on:
					plugs[i]._on_on_off_pressed()
					for ii in range(i):
						plugs[ii]._on_on_off_pressed()
					break
		else:
			var tmp = ""
			for i in output_board.get_children():
				print(i.get_name())
				if i.on:
					tmp += "1"
				else:
					tmp += ("0")
			tb.append(tmp)
			print(tb)
			laps = 0
			pressed = false
			print("done")
			var file = File.new()
			file.open("user://gates", File.READ_WRITE)
			
			var data = []
			data = parse_json(file.get_line())
			
			var nm = self.get_child(8).get_child(1).text
			
			var colors = ["red", "blue", "purple", "orange", "yellow", "green", "black"]
			var color_count = [0, 0, 0, 0, 0, 0, 0]
			
			for i in data:
				color_count[colors.find(i["color"])] += 1
			
			var clr = color_count.find(color_count.min())
				
			var a = {
				name = nm,
				color = clr,
				table = tb
			}
			print(a)
			tb = []
			
		

func _on_Button_pressed():
	pressed = true
	
	
	# data.append(a)
	# file.store_line(to_json(data))


