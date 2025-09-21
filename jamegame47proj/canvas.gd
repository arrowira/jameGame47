extends Node2D

@onready var lines: Node2D = $Line2D

var pressed: bool = false
var currentLine: Line2D = null
var inBounds: bool = false
@export var canvasSize: Vector2 = Vector2(128,128)
@export var topLeftCornerPos: Vector2 = Vector2(128,128)
var clearing = false
var lineColor: Color = Color.BLUE
func clear():
	clearing = true
	for child in lines.get_children():
		
		child.queue_free()
	clearing = false
func _input(event: InputEvent) -> void:
	
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			pressed = event.pressed
			
			if pressed:
				
				#new line created
				currentLine = Line2D.new()
				
				var grad := Gradient.new()
				grad.colors = [lineColor*0.9,lineColor]
				grad.offsets = [0.0, 0.3]
				currentLine.gradient = grad
				
				currentLine.width = 4
				if inBounds:
					lines.add_child(currentLine)
					currentLine.add_point(event.position)
	elif event is InputEventMouseMotion:
		inBounds=topLeftCornerPos.x<event.position.x and event.position.x < topLeftCornerPos.x+canvasSize.x and topLeftCornerPos.y<event.position.y and event.position.y < topLeftCornerPos.y+canvasSize.y
		if pressed and not clearing:
			#actively drawing
			if inBounds and currentLine != null:
				print(clearing)
				currentLine.add_point(event.position)
					


func _on_blue_pressed() -> void:
	lineColor=Color.CORNFLOWER_BLUE


func _on_red_pressed() -> void:
	lineColor=Color.ORANGE_RED



func _on_green_pressed() -> void:
	lineColor=Color.LIME_GREEN


func _on_pink_pressed() -> void:
	lineColor = Color.PLUM
	
func _on_yellow_pressed() -> void:
	lineColor = Color.YELLOW

func _on_purple_pressed() -> void:
	lineColor = Color.MEDIUM_PURPLE
