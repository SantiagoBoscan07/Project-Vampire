extends Control
class_name TransitionBetweenScene
@onready var animation_texture: TextureRect = $TextureRect

func _ready():
	animation_texture.visible = false
