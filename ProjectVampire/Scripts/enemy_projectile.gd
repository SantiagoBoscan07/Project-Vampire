extends Node2D

@export var speed = 100.0
var direction: Vector2 
var velocity: Vector2 = Vector2.ZERO
@onready var hitbox: Hitbox = $Body/Hitbox as Hitbox
@onready var hurtbox: Hurtbox = $Body/Hurtbox as Hurtbox
@onready var health: Health = $Components/Health as Health
@onready var hurt: Hurt = $Components/Hurt as Hurt

func _ready():
	velocity = direction * speed
	set_as_top_level(true)
	hitbox.hit_hurtbox.connect(queue_free.unbind(1))
	health.no_health.connect(queue_free)


func _process(delta):
	global_position -= velocity*delta


func _on_visible_on_screen_enabler_2d_screen_exited():
	queue_free()

