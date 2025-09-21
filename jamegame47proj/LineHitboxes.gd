extends Line2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT)):
		var Hit = Area2D.new()
		var Collider = CollisionShape2D.new()
		var Shape = CircleShape2D.new()
		Shape.radius = 5
		Collider.shape = Shape
		Collider.position = get_global_mouse_position()
		Hit.add_child(Collider)
		add_child(Hit)
