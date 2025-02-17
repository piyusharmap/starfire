extends Node2D

@onready var parallax_bg: ParallaxBackground = $ParallaxBackground
@onready var laser_scene: PackedScene = load("res://scenes/laser.tscn")

@export var scroll_speed := 100.0

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	parallax_bg.scroll_offset.y += scroll_speed * delta
	
func _on_player_ship_shoot(laser_origin: Vector2) -> void:
	var laser = laser_scene.instantiate()
	$Lasers.add_child(laser)
	laser.position = laser_origin
