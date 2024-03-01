extends Node2D
@export var enemyScene: PackedScene

var margin = 8
var screen_width = 800
@onready var spawnerNode: = $SpawnerNode as SpawnerNode
@onready var spawnTimer: Timer = $SpawnTimer

func _ready() -> void:
	spawnTimer.timeout.connect(handle_spawn.bind(enemyScene, spawnTimer))

func handle_spawn(enemy_scene: PackedScene, timer: Timer) -> void:
	spawnerNode.scene = enemy_scene
	spawnerNode.spawn(Vector2(528, randf_range(48, 160)))
	timer.start()
