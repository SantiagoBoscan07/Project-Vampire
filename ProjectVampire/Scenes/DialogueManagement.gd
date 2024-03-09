extends Control

@export var dialogue_resource: DialogueResource
@export var dialogue_to_read: String = "testDialogue"
@export var disableUIBottom: Sprite2D
var showDialog: bool = false

 
func _process(delta):
		if showDialog:
			#THIS IF STATEMENT IS THE DUMBEST LINE OF CODE EVER LMAO
			if disableUIBottom:
				disableUIBottom.visible = false
			DialogueManager.show_dialogue_balloon(dialogue_resource, dialogue_to_read)
			showDialog = false
		if Global.nextLevel:
			if disableUIBottom:
				disableUIBottom.visible = true

