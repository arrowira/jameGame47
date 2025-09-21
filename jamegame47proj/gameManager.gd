extends Node2D


var hundredths: int = 0
var accumulated_time := 0.0
var threshold = 1

func _process(delta):
	accumulated_time += delta
	while accumulated_time >= 0.01:
		accumulated_time -= 0.01
		hundredths += 1
	
	var seconds = hundredths / 100.0
	$timer/timeLeft.text = str(seconds)
	if seconds > threshold:
		#restart
		hundredths = 0
		$model_egg.clearRows()
		$canvas.clear()
		var View = SubViewport.new()
		View.disable_3d = true
		View.transparent_bg = true
		View.size = Vector2(256, 256)
		add_child(View)
		var Con = Node2D.new()
		var R1 = get_node("/root/Node2D/model_egg/rows/row0").duplicate()
		R1.position = Vector2(33, 33)
		Con.add_child(R1)
		var R2 = get_node("/root/Node2D/model_egg/rows/row1").duplicate()
		R2.position = Vector2(33, 51)
		Con.add_child(R2)
		var R3 = get_node("/root/Node2D/model_egg/rows/row2").duplicate()
		R3.position = Vector2(33, 69)
		Con.add_child(R3)
		var R4 = get_node("/root/Node2D/model_egg/rows/row3").duplicate()
		R4.position = Vector2(33, 87)
		Con.add_child(R4)
		var R5 = get_node("/root/Node2D/model_egg/rows/row4").duplicate()
		R5.position = Vector2(33, 105)
		Con.add_child(R5)
		var R6 = get_node("/root/Node2D/model_egg/rows/row5").duplicate()
		R6.position = Vector2(33, 123)
		Con.add_child(R6)
		Con.position = Vector2(100, 0)
		View.add_child(Con)
		await RenderingServer.frame_post_draw
	
		var Test = TextureRect.new()
		Test.texture = View.get_texture()
		Test.size = View.size
		Test.position = Vector2(100, 0)
		add_child(Test)
		
		
	
		
		
