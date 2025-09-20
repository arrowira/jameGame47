extends Node2D

@onready var lines: Node2D = $Line2D

var pressed: bool = false
var currentLine: Line2D = null
var inBounds: bool = false
@export var canvasSize: Vector2 = Vector2(128,128)
@export var topLeftCornerPos: Vector2 = Vector2(128,128)

func _input(event: InputEvent) -> void:
	
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			pressed = event.pressed
			
			if pressed:
				currentLine = Line2D.new()
				currentLine.default_color = Color.BLUE
				currentLine.width = 4
				if inBounds:
					lines.add_child(currentLine)
					currentLine.add_point(event.position)
	elif event is InputEventMouseMotion:
		inBounds=topLeftCornerPos.x<event.position.x and event.position.x < topLeftCornerPos.x+canvasSize.x and topLeftCornerPos.y<event.position.y and event.position.y < topLeftCornerPos.y+canvasSize.y
		if pressed:
			if inBounds:
				currentLine.add_point(event.position)
					
