extends Node2D
@export var itemSpawners: Array[Node2D]

func _process(delta):
	if SpawnerManagement.activateSpawner:
		for index in itemSpawners.size():
			if index == SpawnerManagement.index:
				itemSpawners[index].process_mode = 0
				itemSpawners[index].visible = true
				SpawnerManagement.activateSpawner = false
