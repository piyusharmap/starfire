extends meteor

@onready var meteor_large_textures: Array = [
	preload("res://assets/textures/meteor/meteor_large1.png"),
	preload("res://assets/textures/meteor/meteor_large2.png"),
	preload("res://assets/textures/meteor/meteor_large3.png")
]

@onready var meteor_collision_boundaries: Array = [
	$CollisionShape1, $CollisionShape2, $CollisionShape3
]

@export var meteor_large_durability: int = 3

func _ready() -> void:
	durability = meteor_large_durability
	type = meteor_type.LARGE
	
	assign_texture_and_collision()

func assign_texture_and_collision():
	var randGen = RandomNumberGenerator.new()
	
	var randomIndex = randGen.randi_range(0, meteor_large_textures.size() - 1)
	
	$Sprite2D.texture = meteor_large_textures[randomIndex]
	
	for i in range(meteor_collision_boundaries.size()):
		meteor_collision_boundaries[i].visible = (i == randomIndex)
		
		# With set_deferred we ensure that the changes will only happen after the current physics step
		meteor_collision_boundaries[i].set_deferred("disabled", i != randomIndex)

func _on_area_entered(_area: Area2D) -> void:	
	handle_meteor_hit()
