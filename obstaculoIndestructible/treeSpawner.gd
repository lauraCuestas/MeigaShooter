extends Node2D

var preloadedObstaculos := [
	preload("res://obstaculoIndestructible/obstaculo_indestructible.tscn"),
	preload("res://obstaculoIndestructible/obstaculo_indestructible_02.tscn"),
	preload("res://obstaculoIndestructible/obstaculo_indestructible_03.tscn")
]

@onready var spawnTreeTimer := $spawnTreeTimer

var nextSpawnTime := 1

func _ready():
	randomize()
	spawnTreeTimer.start(nextSpawnTime)

func _on_spawn_tree_timer_timeout():
	
	var obstaculoPreload = preloadedObstaculos[randi() % preloadedObstaculos.size()]
	var obstaculoIndestructible: obstaculoIndestructible = obstaculoPreload.instantiate()
	obstaculoIndestructible.position = Vector2(position.x, position.y)
	get_tree().current_scene.add_child(obstaculoIndestructible)
	
	var nextSpawnTime := randf_range(0.3, 1.5)
	spawnTreeTimer.start(nextSpawnTime)

