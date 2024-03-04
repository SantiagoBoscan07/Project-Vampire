extends Label
var emotionString

func _process(delta):
	match Global.emotionChart:
		0:
			set_text("Neutral")
		1:
			set_text("Happy")
		2:
			set_text("Angry")
		3:
			set_text("Sad")
