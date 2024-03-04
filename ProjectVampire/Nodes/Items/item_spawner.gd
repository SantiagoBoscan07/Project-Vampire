extends Node2D
# @export bool which item to spawn
@export var upItemSpawn: bool
@export var lowItemSpawn: bool
@export var midItemSpawn: bool
# @exports PackedScene Items
@export var itemUpScene: PackedScene
@export var itemDownScene: PackedScene
@export var itemMidScene: PackedScene
# @exports and @onready Misc
@onready var spawnerNode: ItemSpawnerNode = $ItemSpawnerNode as ItemSpawnerNode
@export var itemUpEmotion: int 
@export var itemDownEmotion: int
@export var itemMidEmotion: int


func _on_item_timer_timeout():
	if upItemSpawn:
		spawnerNode.scene = itemUpScene
		spawnerNode.spawn(itemUpEmotion, Vector2(314,48))
	if lowItemSpawn:
		spawnerNode.scene = itemDownScene
		spawnerNode.spawn(itemDownEmotion, Vector2(314,168))
	if midItemSpawn:
		spawnerNode.scene = itemMidScene
		spawnerNode.spawn(itemMidEmotion, Vector2(314,108))

