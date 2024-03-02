extends Node
class_name Flash


const FLASH_MATERIAL = preload("res://effects/whiteflash.tres")

@export var sprite: CanvasItem

@export var flash_duration: = 0.2

var original_sprite_material: Material

var timer: Timer = Timer.new()

func _ready() -> void:
	add_child(timer)
	original_sprite_material = sprite.material


func flash():
	sprite.material = FLASH_MATERIAL
	timer.start(flash_duration)
	await timer.timeout
	sprite.material = original_sprite_material
