extends Label
@onready var player = $"../../Player"
func _process(delta):
	if player.speedSkip:
		visible = true
	else:
		visible = false
