extends CharacterBody2D

@onready var hurtbox: Hurtbox = $Hurtbox as Hurtbox
@onready var hitbox: Hitbox = $Hitbox as Hitbox
@onready var health: Health = $Components/Health as Health
@onready var hurt: Hurt = $Components/Hurt as Hurt
@onready var move: Move = $Components/Move as Move

func _ready() -> void:
	hurtbox.hurt.connect(func(hitbox: Hitbox):
		# Insert Effects When Getting Hit
		pass
		)
	health.no_health.connect(queue_free)


func _on_visible_on_screen_enabler_2d_screen_exited():
	queue_free()
