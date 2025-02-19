class_name meteor extends Area2D

enum meteor_type {
	LARGE,
	MEDIUM,
	SMALL
}

var durability: int
var type: meteor_type

func handle_meteor_hit():
	durability -= 1
	
	if durability == 0:
		queue_free()
