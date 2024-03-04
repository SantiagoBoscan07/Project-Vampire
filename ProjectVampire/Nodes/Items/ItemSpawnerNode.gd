extends Node2D
class_name ItemSpawnerNode

@export var scene: PackedScene

func spawn(emotion: int, global_spawn_position: Vector2 = global_position, parent: Node = get_tree().current_scene) -> Node:
	assert(scene is PackedScene, "Error: The scene export was never set")
	var instance = scene.instantiate()
	match emotion:
		0:
			instance.emotion = "neutral"
		1:
			instance.emotion = "happy"
		2:
			instance.emotion = "sad"
		3:
			instance.emotion = "angry"
	parent.add_child(instance)
	instance.global_position = global_spawn_position
	return instance
