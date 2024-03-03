extends ProgressBar

func _process(delta):
	set_value_no_signal((Global.waitTime - Global.timeLeft)*100)
