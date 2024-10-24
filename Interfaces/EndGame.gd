extends Node2D

func _on_reintentar_pressed():
	get_tree().change_scene_to_file("res://MainScenes/gameplay.tscn")

func _on_sair_pressed():
	get_tree().quit()
