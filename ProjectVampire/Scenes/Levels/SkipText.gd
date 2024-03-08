extends Label

func _process(delta):
	if Global.textSpeedBoost:
		visible = true
	else:
		visible = false
