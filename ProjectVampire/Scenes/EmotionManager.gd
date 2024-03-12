extends Node2D

func _process(delta):
	match Global.emotionChart:
		0:
			Global.enemyVelocityMultiplier = 1
			Global.damageMultiplier = 1
		1:
			Global.enemyVelocityMultiplier = 1.5
			Global.damageMultiplier = 1.5
		2:
			Global.enemyVelocityMultiplier = 1.2
			Global.damageMultiplier = 2
		3:
			Global.enemyVelocityMultiplier = 0.75
			Global.damageMultiplier = 0.5
