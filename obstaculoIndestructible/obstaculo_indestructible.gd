extends Area2D

class_name obstaculoIndestructible

@export var minSpeed: float = 400
@export var maxSpeed: float = 500

var speed: float = 0
var playerInArea: player = null

func _ready():
	speed = randf_range(minSpeed,maxSpeed)

func _process(delta):
	if playerInArea != null:
		playerInArea.damage(1)

func _physics_process(delta):
	position.x -= speed * delta

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

func _on_area_entered(area):
	if area is player:
			playerInArea = area

func _on_area_exited(area):
	if area is player:
		playerInArea = null
