extends Control
var showDialog: bool = false
@export var dialogue_resource: DialogueResource
@export var dialogue_to_read: String = "testDialogue"
@onready var balloon_scene: PackedScene = load("res://Dialogue/balloonEnding.tscn")
@onready var animation = $AnimationPlayer
func _ready():
	Engine.time_scale = 1

func _process(delta):
	if showDialog: 
		animation.play("credits")
		DialogueManager.show_dialogue_balloon_scene(balloon_scene, dialogue_resource, dialogue_to_read)
		showDialog = false
