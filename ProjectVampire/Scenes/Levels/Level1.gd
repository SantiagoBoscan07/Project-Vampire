extends Node2D

func _ready():
	for inputEvent in InputMap.action_get_events("move_up"):
		PlayerStats.upText = inputEvent.as_text().trim_suffix(" (Physical)")
	for inputEvent in InputMap.action_get_events("move_down"):
		PlayerStats.downText = inputEvent.as_text().trim_suffix(" (Physical)")
	for inputEvent in InputMap.action_get_events("move_left"):
		PlayerStats.leftText = inputEvent.as_text().trim_suffix(" (Physical)")
	for inputEvent in InputMap.action_get_events("move_right"):
		PlayerStats.rightText = inputEvent.as_text().trim_suffix(" (Physical)")
	for inputEvent in InputMap.action_get_events("boost"):
		PlayerStats.dashText = inputEvent.as_text().trim_suffix(" (Physical)")
	for inputEvent in InputMap.action_get_events("shoot"):
		PlayerStats.shootText = inputEvent.as_text().trim_suffix(" (Physical)")
	Global.canMidShoot = false
	Global.canLowShoot = false
	Global.canTopShoot = false
