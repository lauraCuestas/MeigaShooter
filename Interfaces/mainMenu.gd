extends Node2D

func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_xogar_pressed():
	get_tree().change_scene_to_file("res://MainScenes/gameplay.tscn")

func _on_controles_pressed():
	get_tree().change_scene_to_file("res://Interfaces/controles.tscn")

func _on_sair_pressed():
	get_tree().quit()
