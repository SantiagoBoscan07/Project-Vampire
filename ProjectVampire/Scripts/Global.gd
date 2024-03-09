extends Node

var enemyVelocityMultiplier = 1
var enemyTimeMultiplier = 1
var enemyHPMultiplier = 1
var damageMultiplier = 1
var global_player_position: Vector2 = Vector2.ZERO
var skeletonShootTime = 1.0
var timeLeft: float
var waitTime: float
var emotionChart: int = 0
var canMidShoot: bool = false
var canLowShoot: bool = false
var canTopShoot: bool = false
var itemObtained: bool = false
var nextLineDialogue: bool = true
var gameOver: bool = false
var textSpeedBoost: bool = false
var nextLevel: bool = false

