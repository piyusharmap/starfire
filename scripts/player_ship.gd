extends CharacterBody2D

@export var speed := 300.0

signal shoot(laser_origin: Vector2)

@export var laser_origin_marker: Marker2D

func _physics_process(_delta: float) -> void:
	var input_direction = Input.get_vector("player_left", "player_right", "player_forward", "player_backward")
	velocity = input_direction * speed
	move_and_slide()
	
	if Input.is_action_just_pressed("player_shoot"):
		shoot.emit(laser_origin_marker.global_position)
	
