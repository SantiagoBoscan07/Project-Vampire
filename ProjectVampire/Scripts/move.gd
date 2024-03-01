extends Node
class_name Move

signal isMoving(bool)
@export var object: Node2D
@export var velocity: Vector2
@export var horizontalMovement: bool
@export var waveMovement: bool
@export var skullMovement: bool
@export var frequency = 5
@export var amplitude = 50

func _process(delta: float) -> void:
	if horizontalMovement:
		object.translate(velocity * Global.enemyVelocityMultiplier * delta)
	if waveMovement:
		if object.position.y >= 160 || object.position.y <= 48:
			velocity.y *= -1
		object.translate(velocity * Global.enemyVelocityMultiplier * delta)
	if skullMovement:
		if object.position.x > 400:
			object.translate(velocity * Global.enemyVelocityMultiplier * delta)
		else:
			emit_signal("isMoving", false)
