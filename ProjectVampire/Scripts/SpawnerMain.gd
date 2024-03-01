extends Node2D
@export var horizontalBat: PackedScene
@export var waveBat: PackedScene

var margin = 8
var screen_width = 800
@onready var spawnerNode: = $SpawnerNode as SpawnerNode
@onready var horizontalBatTimer: Timer = $HorizontalBatTimer

func _ready() -> void:
	horizontalBatTimer.timeout.connect(handle_spawn.bind(horizontalBat, horizontalBatTimer))

func handle_spawn(enemy_scene: PackedScene, timer: Timer) -> void:
	spawnerNode.scene = enemy_scene
	spawnerNode.spawn(Vector2(528, randf_range(52, 150)))
	timer.start()
