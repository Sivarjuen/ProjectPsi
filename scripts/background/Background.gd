extends Node2D

# Speed at which the background scrolls.
var scroll_speed = Vector2(0, 30)

func _process(delta):
	# Move the background.
	position += scroll_speed * delta
