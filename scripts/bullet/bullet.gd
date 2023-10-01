extends Area2D

var speed = 1500  # Adjust the bullet speed as needed.

func _process(delta):
	position += Vector2(0, -speed) * delta
	
	# Check if the bullet is out of the screen bounds.
	if position.y < -100 or position.y > get_viewport_rect().size.y + 100:
		queue_free()  # Remove the bullet from the scene when out of bounds.

#func _on_Bullet_area_entered(area):
#	# Handle collision with other objects (e.g., enemies or walls).
#	queue_free()  # Remove the bullet when it collides with something.
