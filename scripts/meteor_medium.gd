extends meteor

@onready var meteor_medium_textures: Array = [
	preload("res://assets/textures/meteor/meteor_mid1.png"),
	preload("res://assets/textures/meteor/meteor_mid2.png")
]

@onready var meteor_collision_boundaries: Array = [
	$CollisionShape1, $CollisionShape2
]

@export var meteor_medium_durability: int = 2

func _ready() -> void:
	durability = meteor_medium_durability
	type = meteor_type.MEDIUM
	
	assign_texture_and_collision()
	
func assign_texture_and_collision():
	var randGen = RandomNumberGenerator.new()
	
	var randomIndex = randGen.randi_range(0, meteor_medium_textures.size() - 1)
	
	var texture = meteor_medium_textures[randomIndex]
	$Sprite2D.texture = texture
	
	for i in range(meteor_collision_boundaries.size()):
		meteor_collision_boundaries[i].visible = (i == randomIndex)
		
		# With set_deferred we ensure that the changes will only happen after the current physics step
		meteor_collision_boundaries[i].set_deferred("disabled", i != randomIndex)

func _on_area_entered(_area: Area2D) -> void:
	handle_meteor_hit()
	
