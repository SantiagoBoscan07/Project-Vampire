extends AnimatedSprite2D
class_name DeathAnimationEffect
@export var sound_effect: AudioManagerNode

func _ready() -> void:
	sound_effect.play_with_variance()
	animation_finished.connect(queue_free)
	animation_looped.connect(queue_free)
