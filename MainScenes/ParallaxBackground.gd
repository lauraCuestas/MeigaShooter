extends ParallaxBackground

func _process(delta):
	scroll_offset.x -=200* delta
