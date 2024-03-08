extends Control

@onready var inputSettings = $InputSettings
@onready var spriteElement = $AnimatedSprite2D
@export var playerPaused: CharacterBody2D
@onready var menuScene = load("res://Scenes/menu.tscn")

func _on_settings_pressed():
	inputSettings.process_mode = 0
	inputSettings.visible = true
	spriteElement.visible = false
	spriteElement.process_mode = 4


func _on_resume_level_pressed():
	Engine.time_scale = 1
	hide()
	playerPaused.paused = !playerPaused.paused


func _on_restart_level_pressed():
	Engine.time_scale = 1
	get_tree().reload_current_scene()


func _on_menu_pressed():
	Engine.time_scale = 1
	get_tree().change_scene_to_packed(menuScene)
