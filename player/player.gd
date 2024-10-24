extends Area2D
class_name player

var plBulleta := preload("res://bullet/bullet.tscn")

var EndGameMenu := preload("res://Interfaces/EndGame.tscn").instantiate()

@onready var animated := $AnimatedSprite2D

@onready var firingPos := $firingPosition

@onready var fireDelayTimer := $fireDelay
@onready var lifeDelayTimer := $lifeInvencibilty

@onready var fireSound := $fireSound
@onready var damageSound := $damageSound

@export var lifeDelay: float = 1
@export var fireDelay: float = 0.2
@export var speed: float = 300

@export var life: int = 3

var vel:= Vector2(0,0)

func _ready():
	Signals.emit_signal("on_player_life_changed", life)

func _process(delta):
	if vel.y < 0:
		animated.play("arriba")
	elif vel.y > 0:
		animated.play("abajo")
	else:
		animated.play("recto")
	
	if Input.is_action_pressed("shoot") and fireDelayTimer.is_stopped():
		fireSound.play()
		fireDelayTimer.start(fireDelay)
		var bullet := plBulleta.instantiate()
		bullet.global_position = firingPos.global_position
		get_tree().current_scene.add_child(bullet)
		
func _physics_process(delta):
	
	var dirVect := Vector2(0, 0)
	
	if Input.is_action_pressed("move_left"):
		dirVect.x = -1
	elif Input.is_action_pressed("move_right"):
		dirVect.x = 1
	if Input.is_action_pressed("move_up"):
		dirVect.y = -1
	if Input.is_action_pressed("move_down"):
		dirVect.y = 1
	
	vel = dirVect.normalized() * speed
	position += vel * delta
	
	var viewRect := get_viewport_rect()
	position.x = clamp(position.x, 80, (viewRect.size.x - 75))
	position.y = clamp(position.y, 50, (viewRect.size.y - 50))
 
func damage(amount: int):
	if lifeDelayTimer.is_stopped():
		damageSound.play()
		lifeDelayTimer.start(lifeDelay)
		life -= amount
		Signals.emit_signal("on_player_life_changed", life)
		if life <= 0:
			print("Player dead")
			get_tree().current_scene.add_child(EndGameMenu)
			queue_free()
