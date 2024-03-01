extends Node
class_name PositionClamp

@export var player: CharacterBody2D
@export var margin: = 28
@export var horizontalClamp: bool
@export var verticalClamp: bool

var left_border = 16
var right_border = 496
var bottom_border = 200
var up_border = 16

func _process(delta: float) -> void:
	if horizontalClamp:
		player.global_position.x = clamp(player.global_position.x, left_border+margin, right_border-margin)
	if verticalClamp:
		player.global_position.y = clamp(player.global_position.y, up_border+margin, bottom_border-margin)
