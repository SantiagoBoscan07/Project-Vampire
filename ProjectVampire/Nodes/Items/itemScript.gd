extends Node2D
@export var hurtbox: Area2D
@export var hpModifier: bool
var emotion: String = "no emotion"

func _ready():
	hurtbox.area_entered.connect(_on_area_entered)

func _on_area_entered(area):
	print(emotion)
	if hpModifier:
		area.healthModifier += 50
	get_tree().call_group("items","queue_free")
