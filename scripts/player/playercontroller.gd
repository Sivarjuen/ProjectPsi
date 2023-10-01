extends Node2D

# Speed at which the node moves.
var speed = 500
var ship_length = 64
var screen_size = null

func _ready():
	screen_size = get_viewport_rect().size

func _process(delta):
	var velocity = Vector2(0, 0)
	
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1

	# Normalize the velocity to ensure consistent movement speed in all directions.
	velocity = velocity.normalized() * speed

	# Move the node.
	var new_position = position + (velocity * delta)
	
	var left_boundary = ship_length / 2
	var right_boundary = screen_size.x - (ship_length / 2)
	var top_boundary = ship_length / 2
	var bottom_boundary = screen_size.y - (ship_length / 2)
	
	new_position.x = clamp(new_position.x, left_boundary, right_boundary)
	new_position.y = clamp(new_position.y, top_boundary, bottom_boundary)

	# Update the node's position.
	position = new_position
