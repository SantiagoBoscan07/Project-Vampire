extends Node2D
#PackedScenes Export
@export var horizontalBat: PackedScene
@export var waveBat: PackedScene
@export var skull: PackedScene
@export var rock: PackedScene
@export var devil: PackedScene
#Time Export
@export var horizontalBatTime: float = 1
@export var waveTime: float = 1
@export var skullTime: float = 1
@export var rockTime: float = 1
@export var devilTime: float = 1
#Bool Export
@export var spawnHorizontal: bool
@export var spawnWave: bool
@export var spawnSkull: bool
@export var spawnRock: bool
@export var spawnDevil: bool
#Timer onready
@onready var horizontalBatTimer: Timer = $HorizontalBatTimer
@onready var waveTimer: Timer = $WaveTimer
@onready var skullTimer: Timer = $SkullTimer
@onready var rockTimer: Timer = $RockTimer
@onready var devilTimer: Timer = $DevilTimer
#Misc onready and export
@export var amountOfEnemies: int = 5
@onready var spawnerNode: = $SpawnerNode as SpawnerNode
var spawnCount: int
var endWave: bool = false

func _ready() -> void:
	if spawnHorizontal:
		horizontalBatTimer.wait_time = horizontalBatTime
		horizontalBatTimer.timeout.connect(handle_spawn.bind(horizontalBat, horizontalBatTimer))
		horizontalBatTimer.start()
	if spawnWave:
		waveTimer.wait_time = waveTime
		waveTimer.timeout.connect(handle_spawn.bind(waveBat, waveTimer))
		waveTimer.start()
	if spawnSkull:
		skullTimer.wait_time = skullTime
		skullTimer.timeout.connect(handle_spawn.bind(skull, skullTimer))
		skullTimer.start()
	if spawnRock:
		rockTimer.wait_time = rockTime
		rockTimer.timeout.connect(handle_spawn.bind(rock, rockTimer))
		rockTimer.start()
	if spawnDevil:
		devilTimer.wait_time = devilTime
		devilTimer.timeout.connect(handle_spawn_devil.bind(devil, devilTimer))
		devilTimer.start()

func handle_spawn(enemy_scene: PackedScene, timer: Timer) -> void:
	spawnerNode.scene = enemy_scene
	spawnerNode.spawn(Vector2(528, randf_range(52, 150)))
	spawnCounter(timer)

func handle_spawn_devil(enemy_scene: PackedScene, timer: Timer) -> void:
	spawnerNode.scene = enemy_scene
	spawnerNode.spawn(Vector2(randf_range(64, 115), -11))
	spawnCounter(timer)


func spawnCounter(timer):
	spawnCount += 1
	if spawnCount < amountOfEnemies:
		timer.start()
	elif spawnCount >= amountOfEnemies:
		timer.stop()
		endWave = true


func _process(delta):
	if endWave:
		if get_tree().get_first_node_in_group("enemy") == null:
			Global.itemObtained = true
			process_mode = 4
