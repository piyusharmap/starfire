extends CharacterBody2D

@export var SPEED := 300.0


func _physics_process(delta: float) -> void:
	var input_direction = Input.get_vector("player_left", "player_right", "player_forward", "player_backward")
	velocity = input_direction * SPEED
	move_and_slide()
	
	if Input.is_action_just_pressed("player_shoot"):
		pass
