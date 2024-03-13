extends ColorRect
@onready var soundFadeBlack = $SoundFadeBlack as AudioManagerNode
@onready var soundFadeNormal = $SoundFadeNormal as AudioManagerNode
@onready var animationPlayer = $AnimationPlayer as AnimationPlayer
@export var dialogueActivator: Control
@export var sceneToTransition: PackedScene
@onready var endingScene: PackedScene = load("res://Scenes/ending.tscn")
@export var musicToStart: AudioManagerNode
@export var transitionToEnding: bool

func _process(delta):
	if Global.nextLevel:
		set_next_animation(1)
		Global.nextLevel = false

func set_next_animation(fading_black: int):
	if (fading_black == 1):
		visible = true
		animationPlayer.queue("FadeBlack")
	elif (fading_black == 0):
		visible = true
		animationPlayer.queue("FadeNormal")

func _on_animation_player_animation_started(anim_name):
	if anim_name == "FadeBlack":
		if musicToStart:
			musicToStart.playing = false
		soundFadeBlack.play_with_variance()
	if anim_name == "FadeNormal":
		if musicToStart:
			musicToStart.playing = false
		soundFadeNormal.play_with_variance()



func _on_animation_player_animation_finished(anim_name):
	if anim_name == "FadeBlack":
		visible = false
		if sceneToTransition and !transitionToEnding:
			get_tree().change_scene_to_packed(sceneToTransition)
		elif transitionToEnding:
			get_tree().change_scene_to_packed(endingScene)
	if anim_name == "FadeNormal":
		visible = false
		if musicToStart:
			musicToStart.play()
		if dialogueActivator:
			dialogueActivator.showDialog = true
