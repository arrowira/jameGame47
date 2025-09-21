extends Sprite2D

func _ready() -> void:
	resetPattern()
func resetPattern():
	frame = randi_range(0,41)
