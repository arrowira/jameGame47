extends Sprite2D

var P0 = preload("res://Patterns/Pattern0.tscn")

func _ready() -> void:
	resetPattern()
func resetPattern():
	frame = randi_range(0,41)
