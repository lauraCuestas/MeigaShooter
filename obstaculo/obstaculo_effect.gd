extends CPUParticles2D


@onready var popSound := $popSound

func _ready():
	emitting = true
	popSound.play()

func _process(delta):
	if !emitting:
		queue_free()
