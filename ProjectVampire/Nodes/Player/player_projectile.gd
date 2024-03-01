extends Node2D

var speed = 500.0
var direction: Vector2 = Vector2.RIGHT
var velocity: Vector2 = Vector2.ZERO
@onready var hitbox: Hitbox = $Body/Hitbox as Hitbox


func _ready():
	set_as_top_level(true)
	velocity = direction * speed
	hitbox.hit_hurtbox.connect(queue_free.unbind(1))



func _process(delta):
	global_position += velocity*delta


func _on_visible_on_screen_enabler_2d_screen_exited():
	queue_free()

