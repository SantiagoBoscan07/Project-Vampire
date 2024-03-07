extends Control

@export var action_items: Array[String]
@export var initialScene: PackedScene
@onready var inputSettings = $InputSettings
@onready var spriteElements = $SpriteElements 

func _on_start_game_pressed():
	get_tree().change_scene_to_packed(initialScene)


func _on_settings_pressed():
	spriteElements.process_mode = 4
	spriteElements.visible = false
	inputSettings.process_mode = 0
	inputSettings.visible = true


func _on_quit_pressed():
	get_tree().quit()
