extends Control

@onready var menuScene = load("res://Scenes/menu.tscn")
@export var restartScene: PackedScene


func _on_try_again_pressed():
	Global.gameOver = false
	get_tree().reload_current_scene()




func _on_menu_button_pressed():
	Global.gameOver = false
	get_tree().change_scene_to_packed(menuScene)

