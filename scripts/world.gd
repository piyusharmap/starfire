extends Node2D

@onready var parallax_bg: ParallaxBackground = $ParallaxBackground

@export var SCROLL_SPEED := 100.0

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	parallax_bg.scroll_offset.y += SCROLL_SPEED * delta
