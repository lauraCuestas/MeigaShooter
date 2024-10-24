extends Area2D

@export var speed:  float = -500

var pBulletEffect :=preload("res://bullet/bullet_effect.tscn")
func _physics_process(delta):
	position.x -= speed * delta

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


func _on_area_entered(area):
	if area.is_in_group("damageable"):
		var bulletEffect := pBulletEffect.instantiate()
		bulletEffect.position = position
		get_parent().add_child(bulletEffect)
		area.damage(1)
		queue_free()
