extends Area2D
class_name Hitbox

@export var damage = 1.0
var initialDamage 

signal hit_hurtbox(hurtbox)

func _ready():
	area_entered.connect(_on_hurtbox_entered)
	initialDamage = damage

func _on_hurtbox_entered(hurtbox: Hurtbox):
	if not hurtbox is Hurtbox: return
	
	if hurtbox.is_invicible: return
	
	hit_hurtbox.emit(hurtbox)
	damage *= Global.damageMultiplier
	hurtbox.hurt.emit(self)
