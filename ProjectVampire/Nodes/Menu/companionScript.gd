extends Node2D

@onready var companionSprite = $Sprite2D as Sprite2D

func _process(delta):
	match Global.emotionChart:
		0:
			companionSprite.frame = 0
		1:
			companionSprite.frame = 2
		2:
			companionSprite.frame = 1
		3:
			companionSprite.frame = 3
