extends Label
var labelString: String
var hp
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	hp = PlayerStats.currentHealth
	labelString = "HP: " + str(hp)
	set_text(labelString)
