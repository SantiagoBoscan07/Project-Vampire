extends Camera2D
@export var randomStrength: float = 3
@export var shakeFade: float = 4.5
@export var musicStop: AudioManagerNode
@export var shakeSound: AudioManagerNode
var random = RandomNumberGenerator.new()
var shakeStrength: float = 0.0

func _process(delta):
	if Global.shake:
		musicStop.stream_paused = true
		shakeSound.play_with_variance()
		get_shake() 
	elif !Global.shake:
		shakeSound.playing = false
		musicStop.stream_paused = false
	if shakeStrength > 0:
		shakeStrength = lerpf(shakeStrength, 0, shakeFade * delta)
		offset = randomOffset()

func get_shake():
	shakeStrength = randomStrength

func randomOffset() -> Vector2:
	return Vector2(random.randf_range(-shakeStrength, shakeStrength), random.randf_range(-shakeStrength, shakeStrength))
