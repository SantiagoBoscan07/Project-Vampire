extends CharacterBody2D

@onready var hurtbox: Hurtbox = $Hurtbox as Hurtbox
@onready var hitbox: Hitbox = $Hitbox as Hitbox
@onready var health: Health = $Components/Health as Health
@onready var hurt: Hurt = $Components/Hurt as Hurt
@onready var move: Move = $Components/Move as Move
@onready var shake: Shake = $Components/Shake as Shake
@onready var flash: Flash = $Components/Flash as Flash
@onready var damageSoundEffect = $DamageSoundEffect as AudioManagerNode

func _ready() -> void:
	hurtbox.hurt.connect(func(hitbox: Hitbox):
		shake.tween_shake()
		flash.flash()
		damageSoundEffect.play_with_variance()
		)
	health.no_health.connect(die)

func _on_visible_on_screen_enabler_2d_screen_exited():
	queue_free()

func die():
	Global.enemyTimeMultiplier -= 0.2
	queue_free()
