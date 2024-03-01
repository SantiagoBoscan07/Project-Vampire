extends Node
class_name Move

@export var object: Node2D
@export var velocity: Vector2

func _process(delta: float) -> void:
	object.translate(velocity*delta)
