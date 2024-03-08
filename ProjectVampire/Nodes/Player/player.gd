extends CharacterBody2D
class_name Player

@onready var projectilePreload: PackedScene = preload("res://Nodes/Player/player_projectile.tscn")
@onready var middleShootingPosition = $Body/MiddleShootingPosition
@onready var topShootingPosition = $Body/TopShootingPosition
@onready var lowShootingPosition = $Body/LowShootingPosition
@onready var fireDelayTimer = $ShootDelay
@onready var health: Health = $Health as Health
@onready var shake: Shake = $Shake as Shake
@onready var flash: Flash = $Flash as Flash
@onready var hurtbox: Hurtbox = $Hurtbox as Hurtbox
@onready var boostTimer = $Body/BoostTimer
@onready var itemDetector = $ItemDetector
@onready var damageSoundEffect = $DamageSoundEffect as AudioManagerNode
@onready var boostSoundEffect = $BoostSoundEffect as AudioManagerNode
@onready var shootSoundEffect = $ShootSoundEffect as AudioManagerNode
@onready var gameOverScreen = $"../UI/GameOverScreen"
@onready var levelMusic = $"../LevelMusic"
var canDash: bool = true
var boost_speed 
var direction: Vector2
var projectile

func _ready():
	PlayerStats.max_speed = 200
	PlayerStats.normal_speed = PlayerStats.max_speed
	hurtbox.hurt.connect(func(hitbox: Hitbox):
		shake.tween_shake()
		flash.flash()
		damageSoundEffect.play_with_variance()
		)
	health.no_health.connect(gameOver)


func _process(delta):
	Global.global_player_position = global_position
	PlayerStats.currentHealth  = health.health 
	Global.timeLeft = boostTimer.time_left
	Global.waitTime = boostTimer.wait_time
	if itemDetector.healthModifier > 0:
		health.health += itemDetector.healthModifier
		itemDetector.healthModifier = 0


func _physics_process(delta):
	direction = Input.get_vector("move_left","move_right","move_up","move_down")
	if Input.is_action_just_pressed("boost") and canDash:
		boost()
	if direction.length() > 1.0:
		direction = direction.normalized()
	velocity.x = move_toward(velocity.x, PlayerStats.max_speed * direction.x, PlayerStats.acceleration)
	velocity.y = move_toward(velocity.y, PlayerStats.max_speed * direction.y, PlayerStats.acceleration)
	move_and_slide()
	if Input.is_action_pressed("shoot") and fireDelayTimer.is_stopped() and Global.canMidShoot:
		shoot()


func _on_boost_timer_timeout():
	PlayerStats.max_speed = PlayerStats.normal_speed
	canDash = true

func gameOver():
	levelMusic.playing = false
	Global.gameOver = true
	gameOverScreen.visible = true
	PlayerStats.currentHealth = 0
	process_mode = 4
	hide()

func shoot():
		shootSoundEffect.play_with_variance()
		fireDelayTimer.start(PlayerStats.fireDelayTime)
		projectile = projectilePreload.instantiate()
		projectile.position = middleShootingPosition.global_position
		get_tree().current_scene.add_child(projectile)
		if Global.canTopShoot:
			projectile = projectilePreload.instantiate()
			projectile.position = topShootingPosition.global_position
			get_tree().current_scene.add_child(projectile)
		if Global.canLowShoot:
			projectile = projectilePreload.instantiate()
			projectile.position = lowShootingPosition.global_position
			get_tree().current_scene.add_child(projectile)

func boost():
	boostSoundEffect.play_with_variance()
	boost_speed = PlayerStats.normal_speed * PlayerStats.boostMultiplier
	PlayerStats.max_speed = boost_speed
	canDash = false
	boostTimer.start()
