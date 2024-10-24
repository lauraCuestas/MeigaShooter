extends Control

var pLifeIcon := preload("res://HUD/life_icon.tscn")
@onready var lifeContainer := $lifeContainer
@onready var scoreLabel := $Score

var score: int = 0

func _ready():
	clearLives()
	Signals.on_player_life_changed.connect(_on_player_life_changed)
	Signals.on_score_increment.connect(_on_score_increment)
	
func clearLives():
	for child in lifeContainer.get_children():
		lifeContainer.remove_child(child)
		child.queue_free()

func setLives(lives: int):
	clearLives()
	for i in range(lives):
		lifeContainer.add_child(pLifeIcon.instantiate())

func _on_score_increment(amount: int):
	score += amount
	scoreLabel.text = str(score)
	
func _on_player_life_changed(life: int):
	setLives(life)
	

