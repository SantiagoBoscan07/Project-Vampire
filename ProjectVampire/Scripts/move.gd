extends Node
class_name Move

@export var object: Node2D
@export var velocity: Vector2
@export var horizontalMovement: bool
@export var waveMovement: bool
@export var frequency = 5
@export var amplitude = 50

func _ready():
	Global.enemyVelocity = velocity

func _process(delta: float) -> void:
	if horizontalMovement:
		object.translate(Global.enemyVelocity * delta)
	if waveMovement:
		if object.position.y >= 168 || object.position.y <= 48:
			Global.enemyVelocity.y *= -1
		object.translate(Global.enemyVelocity * delta)
