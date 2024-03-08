extends Control

@export var dialogue_resource: DialogueResource
@export var dialogue_to_read: String = "testDialogue"
var showDialog: bool = true

 
func _process(delta):
		if showDialog:
			DialogueManager.show_dialogue_balloon(dialogue_resource, dialogue_to_read)
			showDialog = false

