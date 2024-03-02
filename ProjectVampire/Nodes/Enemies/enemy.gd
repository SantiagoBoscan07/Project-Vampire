extends CharacterBody2D

@onready var hurtbox: Hurtbox = $Hurtbox as Hurtbox
@onready var hitbox: Hitbox = $Hitbox as Hitbox
@onready var health: Health = $Components/Health as Health
@onready var hurt: Hurt = $Components/Hurt as Hurt
@onready var move: Move = $Components/Move as Move
@onready var shake: Shake = $Components/Shake as Shake
@onready var flash: Flash = $Components/Flash as Flash

func _ready() -> void:
	hurtbox.hurt.connect(func(hitbox: Hitbox):
		shake.tween_shake()
		flash.flash()
		)
	health.no_health.connect(queue_free)


func _on_visible_on_screen_enabler_2d_screen_exited():
	queue_free()
