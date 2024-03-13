extends Control

@export var action_items: Array[String]
@export var initialScene: PackedScene
@onready var inputSettings = $InputSettings
@onready var spriteElements = $SpriteElements 
@onready var transitionCutout = $TransitionCutout
@onready var quitButton = $SpriteElements/Quit
func _ready():
	transitionCutout.set_next_animation(0)
	if OS.has_feature("web"):
		quitButton.visible = false


func _on_start_game_pressed():
	transitionCutout.set_next_animation(1)


func _on_settings_pressed():
	spriteElements.process_mode = 4
	spriteElements.visible = false
	inputSettings.process_mode = 0
	inputSettings.visible = true


func _on_quit_pressed():
	get_tree().quit()
