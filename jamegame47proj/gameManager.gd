extends Node2D


var hundredths: int = 0
var accumulated_time := 0.0
var threshold = 20
var Score = 0

func _process(delta):
	accumulated_time += delta
	while accumulated_time >= 0.01:
		accumulated_time -= 0.01
		hundredths += 1
	
	var seconds = hundredths / 100.0
	$timer/timeLeft.text = str(seconds)
	if seconds > threshold:
		#restart
		for i in get_node("/root/Node2D/canvas/Line2D").get_children():
			Score+=i.points.size()
		
		
		get_node("/root/Node2D/timer/Label2").text = "Score: " + str(Score)
		hundredths = 0
		$model_egg.clearRows()
		$canvas.clear()
		
		
		
		
	
		
		
