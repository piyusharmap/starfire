extends Node2D

@onready var boundary_top := $BoundaryTop
@onready var boundary_bottom := $BoundaryBottom
@onready var boundary_left := $BoundaryLeft
@onready var boundary_right := $BoundaryRight

@export var boundary_tickness := 20.0

func _ready() -> void:
	var screen_size := get_viewport_rect().size
	
	set_boundary(boundary_top, Vector2(screen_size.x/2, 0), Vector2(screen_size.x, boundary_tickness))
	set_boundary(boundary_bottom, Vector2(screen_size.x/2, screen_size.y), Vector2(screen_size.x, boundary_tickness))
	set_boundary(boundary_left, Vector2(0, screen_size.y/2), Vector2(boundary_tickness, screen_size.y))
	set_boundary(boundary_right, Vector2(screen_size.x, screen_size.y/2), Vector2(boundary_tickness, screen_size.y))

func set_boundary(boundary: StaticBody2D, boundary_position: Vector2, boundary_size: Vector2) -> void:
	boundary.position = boundary_position
	var shape = boundary.get_children()[0].shape
	shape.size = boundary_size
