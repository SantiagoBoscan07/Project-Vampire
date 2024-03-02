extends ProgressBar


func _ready():
	pass


func _process(delta):
	set_value_no_signal((Global.waitTime - Global.timeLeft)*100)
