extends Node2D

@export var transitionCutout: ColorRect

func _ready():
	transitionCutout.set_next_animation(0)
