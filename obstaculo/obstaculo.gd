extends Area2D

class_name obstaculo

var pMeteorEffect := preload("res://obstaculo/obstaculo_effect.tscn")

@export var minSpeed: float = 400
@export var maxSpeed: float = 500
@export var minRotationRate: float =  -10
@export var maxRotationRate: float =  10

@export var scoreValue: float = 1
@export var life: int = 5

var speed: float = 0
var rotationRate: float = 0 
var playerInArea: player = null

func _ready():
	speed = randf_range(minSpeed,maxSpeed)
	rotationRate = randf_range(minRotationRate, maxRotationRate)

func _process(delta):
	if playerInArea != null:
		playerInArea.damage(1)

func _physics_process(delta):
	rotation_degrees += rotationRate * delta
	
	position.x -= speed * delta

func damage(amount: int):
	life -=amount
	if life <= 0:
		var effect := pMeteorEffect.instantiate()
		effect.position = position
		get_parent().add_child(effect)
		Signals.emit_signal("on_score_increment", scoreValue)
		queue_free()

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

func _on_area_entered(area):
	if area is player:
		playerInArea = area

func _on_area_exited(area):
	if area is player:
		playerInArea = null
