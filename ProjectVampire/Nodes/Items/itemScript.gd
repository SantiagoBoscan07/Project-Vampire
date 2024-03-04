extends Node2D
@onready var itemSprite = $Sprite2D
@onready var audioManager = $AudioManagerNode as AudioManagerNode
@export var hurtbox: Area2D
@export var hpModifier: bool
@export var shootPositionModifier: bool
@export var shootDelayModifier: bool
@export var damageModifier: bool
@export var boostModifier: bool
@export var enemySpeed: bool
@export var enemySpeedMinus: bool
var up_tween
var down_tween
var fade_tween
var emotion: int


func _ready():
	hurtbox.area_entered.connect(_on_area_entered)
	up()

func fade():
	fade_tween = get_tree().create_tween()
	up_tween = get_tree().create_tween()
	fade_tween.tween_property(itemSprite, "modulate", Color(255,255,255,0), 4.0)
	up_tween.tween_property(itemSprite, "position", Vector2(0,-12),3.0)
	fade_tween.connect("finished", on_fade_finished)

func _on_area_entered(area):
	hurtbox.area_entered.disconnect(_on_area_entered)
	itemModifier(area)
	Global.emotionChart = emotion
	audioManager.play_with_variance()
	remove_from_group("unselectedItem")
	add_to_group("selectedItem")
	get_tree().call_group("unselectedItem","queue_free")
	stop_tweens()
	fade()

func itemModifier(area):
	if hpModifier:
		area.healthModifier += 50
	if shootPositionModifier:
		if !Global.canMidShoot:
			Global.canMidShoot = true
		elif Global.canMidShoot and !Global.canTopShoot:
			Global.canTopShoot = true
		elif Global.canMidShoot and Global.canTopShoot and !Global.canLowShoot:
			Global.canLowShoot = true
	if shootDelayModifier:
		PlayerStats.fireDelayTime *= 0.75
	if damageModifier:
		Global.damageMultiplier += 1
	if boostModifier:
		PlayerStats.boostMultiplier += 0.75
	if enemySpeed:
		Global.enemyVelocityMultiplier += 0.5
	if enemySpeedMinus:
		Global.enemyVelocityMultiplier -= 0.7


func on_fade_finished():
	up_tween.stop()
	queue_free()


func up():
	up_tween = get_tree().create_tween()
	up_tween.tween_property(itemSprite, "position",  Vector2(0,2),0.5)
	up_tween.connect("finished", on_up_tween_finished)


func on_up_tween_finished():
	down()


func down():
	down_tween = get_tree().create_tween()
	down_tween.tween_property(itemSprite, "position",  Vector2(0,-2),0.5)
	down_tween.connect("finished", on_down_tween_finished)


func on_down_tween_finished():
	up()


func stop_tweens():
	up_tween.stop()
	down_tween.stop()
