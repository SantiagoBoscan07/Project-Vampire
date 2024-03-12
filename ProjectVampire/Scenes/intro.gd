extends Node2D
@onready var transition = $TransitionCutout
@onready var animation = $AnimationPlayer



func _on_animation_player_animation_finished(anim_name):
	if anim_name == "intro":
		transition.set_next_animation(1)
