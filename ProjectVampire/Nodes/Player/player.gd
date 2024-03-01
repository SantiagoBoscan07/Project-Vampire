extends CharacterBody2D
class_name Player

@onready var projectilePreload: PackedScene = preload("res://Nodes/Player/player_projectile.tscn")
@onready var shootingPosition = $Body/ShootingPosition
@onready var fireDelayTimer = $ShootDelay
@onready var health: Health = $Health as Health
var normal_speed
var boost_speed 
var direction: Vector2
var projectile

func _ready():
	normal_speed = PlayerStats.max_speed
	boost_speed = normal_speed * 2
	health.no_health.connect(queue_free)

func _process(delta):
	Global.global_player_position = global_position
	direction = Input.get_vector("move_left","move_right","move_up","move_down")
	if Input.is_action_pressed("shoot") and fireDelayTimer.is_stopped():
		fireDelayTimer.start(PlayerStats.fireDelayTime)
		projectile = projectilePreload.instantiate()
		projectile.position = shootingPosition.global_position
		get_tree().current_scene.add_child(projectile)
	if Input.is_action_just_pressed("boost"):
		PlayerStats.max_speed = boost_speed
		get_node("Body/BoostTimer").start()
	if direction.length() > 1.0:
		direction = direction.normalized()
	velocity.x = move_toward(velocity.x, PlayerStats.max_speed * direction.x, PlayerStats.acceleration)
	velocity.y = move_toward(velocity.y, PlayerStats.max_speed * direction.y, PlayerStats.acceleration)
	move_and_slide()


func _on_boost_timer_timeout():
	PlayerStats.max_speed = normal_speed
