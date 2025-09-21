extends Sprite2D

var P0 = preload("res://Patterns/Pattern0.tscn")

func _ready() -> void:
	resetPattern()
func resetPattern():
	frame = randi_range(0,41)
	var P = P0.instantiate()
	add_child(P)
	P.position = Vector2(100, 0)
