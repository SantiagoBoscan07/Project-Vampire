extends Node2D
class_name Shoot


var isMoving: bool = true
@onready var ray_cast = $"../../PlayerTracker"
@onready var shootTimer = $"../../ShootTimer"
@onready var alertTimer = $"../../AlertTimer"
@onready var enemy = $"../.."
@onready var shootPosition = $"../../ShootingPosition"
@onready var projectilePreload : PackedScene = preload("res://Nodes/Enemies/enemy_projectile.tscn")
var projectile

func _ready():
	shootTimer.wait_time *= Global.skeletonShootTime

func _physics_process(delta):
	if !isMoving:
		_aim()
		_player_collision()

func _aim():
	ray_cast.target_position = ray_cast.to_local(Global.global_player_position)

func _player_collision():
	if ray_cast.is_colliding() and shootTimer.is_stopped():
		shootTimer.start()


func _shoot():
	enemy.scale.x += 0.2
	enemy.scale.y += 0.2
	alertTimer.wait_time = 0.2
	alertTimer.start()
	await alertTimer.timeout
	enemy.scale.x -= 0.2
	enemy.scale.y -= 0.2
	projectile = projectilePreload.instantiate()
	projectile.position = shootPosition.global_position
	projectile.direction = (ray_cast.target_position).normalized() * -1
	get_tree().current_scene.add_child(projectile)

func _on_move_is_moving(bool):
	isMoving = bool


func _on_shoot_timer_timeout():
	_shoot()
