extends CanvasLayer

@export var balloon: Control 
@export var dialogue_label: DialogueLabel  
@onready var dialogueSound = $AudioManagerNode as AudioManagerNode
@onready var nextLineTimer = $NextLineTimer as Timer
## The dialogue resource
var resource: DialogueResource

## Temporary game states
var temporary_game_states: Array = []

## See if we are waiting for the player
var is_waiting_for_input: bool = false

## See if we are running a long mutation and should hide the balloon
var will_hide_balloon: bool = false

## The current line
var dialogue_line: DialogueLine:
	set(next_dialogue_line):
		is_waiting_for_input = false
		balloon.focus_mode = Control.FOCUS_ALL
		balloon.grab_focus()

		# The dialogue has finished so close the balloon
		if not next_dialogue_line:
			queue_free()
			return

		# If the node isn't ready yet then none of the labels will be ready yet either
		if not is_node_ready():
			await ready

		dialogue_line = next_dialogue_line


		dialogue_label.hide()
		dialogue_label.dialogue_line = dialogue_line


		# Show our balloon
		balloon.show()
		will_hide_balloon = false

		dialogue_label.show()
		if not dialogue_line.text.is_empty():
			dialogue_label.type_out()
			await dialogue_label.finished_typing

		# Wait for input
		if dialogue_line.responses.size() > 0:
			balloon.focus_mode = Control.FOCUS_NONE
		elif dialogue_line.time != "":
			var time = dialogue_line.text.length() * 0.02 if dialogue_line.time == "auto" else dialogue_line.time.to_float()
			await get_tree().create_timer(time).timeout
			next(dialogue_line.next_id)
		else:
			is_waiting_for_input = true
			balloon.focus_mode = Control.FOCUS_ALL
			balloon.grab_focus()
	get:
		return dialogue_line


func _ready() -> void:
	balloon.hide()
	Engine.get_singleton("DialogueManager").mutated.connect(_on_mutated)


## Start some dialogue
func start(dialogue_resource: DialogueResource, title: String, extra_game_states: Array = []) -> void:
	temporary_game_states =  [self] + extra_game_states
	is_waiting_for_input = false
	resource = dialogue_resource
	self.dialogue_line = await resource.get_next_dialogue_line(title, temporary_game_states)


## Go to the next line
func next(next_id: String) -> void:
	self.dialogue_line = await resource.get_next_dialogue_line(next_id, temporary_game_states)


### Signals


func _on_mutated(_mutation: Dictionary) -> void:
	is_waiting_for_input = false
	will_hide_balloon = true
	get_tree().create_timer(0.1).timeout.connect(func():
		if will_hide_balloon:
			will_hide_balloon = false
			balloon.hide()
	)


func _on_dialogue_label_spoke(letter, letter_index, speed):
	if not letter in [" ", "."]:
		dialogueSound.play_with_variance()


func timerNextDialogue():
	nextLineTimer.start()
	await nextLineTimer.timeout
	next(dialogue_line.next_id)


func _on_dialogue_label_finished_typing():
	if Global.nextLineDialogue:
		timerNextDialogue()


func _process(delta):
	if Global.itemObtained:
		timerNextDialogue()
		Global.nextLineDialogue = true
		Global.itemObtained = false
	if Global.gameOver:
		queue_free()
	if Global.textSpeedBoost:
		dialogue_label.seconds_per_step = 0.01
		nextLineTimer.wait_time = 0.1
	else:
		dialogue_label.seconds_per_step = 0.07
		nextLineTimer.wait_time = 2
