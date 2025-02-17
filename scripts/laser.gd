extends Area2D

@export var laser_speed = 500.0

func _process(delta: float) -> void:
	position += Vector2(0, -laser_speed) * delta
