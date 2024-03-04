extends Node2D
class_name ItemSpawnerNode

@export var scene: PackedScene

func spawn(emotion: int, global_spawn_position: Vector2 = global_position, parent: Node = get_tree().current_scene) -> Node:
	assert(scene is PackedScene, "Error: The scene export was never set")
	var instance = scene.instantiate()
	match emotion:
		0:
			instance.emotion = 0
		1:
			instance.emotion = 1
		2:
			instance.emotion = 2
		3:
			instance.emotion = 3
	parent.add_child(instance)
	instance.global_position = global_spawn_position
	return instance
