extends Node
class_name Death


@export var actor: Node2D
@export var health: Health
@export var death_effect_spawner: SpawnerNode

func _ready() -> void:
	health.no_health.connect(destroy)

func destroy() -> void:
	death_effect_spawner.spawn(actor.global_position)
	actor.queue_free()
