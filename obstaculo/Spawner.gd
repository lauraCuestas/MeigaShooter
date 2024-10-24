extends Node2D

var preloadedObstaculos := [
	preload("res://obstaculo/obstaculo.tscn"),
	preload("res://obstaculo/obstaculo_03.tscn"),
	preload("res://obstaculo/obstaculo02.tscn")
]

@onready var spawnTimer := $SpawnTimer

var nextSpawnTime := 3

func _ready():
	randomize()
	spawnTimer.start(nextSpawnTime)


func _on_spawn_timer_timeout():
	
	var viewRect := get_viewport_rect()
	
	var ypos := randf_range((viewRect.position.y + 75), (viewRect.end.y - 275))
	
	var obstaculoPreload = preloadedObstaculos[randi() % preloadedObstaculos.size()]
	var obstaculo: obstaculo = obstaculoPreload.instantiate()
	obstaculo.position = Vector2(position.x, ypos)
	get_tree().current_scene.add_child(obstaculo)
	
	nextSpawnTime == nextSpawnTime - 0.2

	
	spawnTimer.start(nextSpawnTime)
