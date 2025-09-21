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
		var Rows = get_node("/root/Node2D/model_egg/rows/row0")
		var Con = Rows.duplicate()
		Con.position = Vector2(20, 20)
		View.add_child(Con)
		await RenderingServer.frame_post_draw
	
		var Test = TextureRect.new()
		Test.texture = View.get_texture()
		Test.size = View.size
		Test.position = Vector2(100, 100)
		add_child(Test)
