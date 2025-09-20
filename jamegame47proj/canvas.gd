extends Node2D

@onready var lines: Node2D = $Line2D

var pressed: bool = false
var currentLine: Line2D = null
var inBounds: bool = false
@export var canvasSize: Vector2 = Vector2(128,128)
@export var topLeftCornerPos: Vector2 = Vector2(128,128)

var lineColor: Color = Color.BLUE

func _input(event: InputEvent) -> void:
	
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			pressed = event.pressed
			
			if pressed:
				
				#new line created
				currentLine = Line2D.new()
				#urrentLine.default_color = Color.BLUE
				var grad := Gradient.new()
				grad.colors = [lineColor*0.7,lineColor] # pick any colors
				grad.offsets = [0.0, 0.3]
				currentLine.gradient = grad
				
				currentLine.width = 4
				if inBounds:
					lines.add_child(currentLine)
					currentLine.add_point(event.position)
	elif event is InputEventMouseMotion:
		inBounds=topLeftCornerPos.x<event.position.x and event.position.x < topLeftCornerPos.x+canvasSize.x and topLeftCornerPos.y<event.position.y and event.position.y < topLeftCornerPos.y+canvasSize.y
		if pressed:
			#actively drawing
			if inBounds:
			
				currentLine.add_point(event.position)
					


func _on_blue_pressed() -> void:
	lineColor=Color.BLUE


func _on_red_pressed() -> void:
	lineColor=Color.ORANGE_RED



func _on_green_pressed() -> void:
	lineColor=Color.LIME_GREEN
