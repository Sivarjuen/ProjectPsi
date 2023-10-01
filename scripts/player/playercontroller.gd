extends Node2D

# Speed at which the node moves.
var speed = 500
var ship_length = 64
var can_shoot = true
var screen_size = null
var bullet_scene = preload("res://scenes/bullet.tscn")

func _ready():
	screen_size = get_viewport_rect().size

func _physics_process(delta):
	# Movement
	var velocity = Vector2(0, 0)
	
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1

	velocity = velocity.normalized() * speed
	move(velocity, delta)
	
	# Shooting
	if Input.is_action_pressed("shoot") and can_shoot:
		shoot()

func move(velocity, delta):
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

func shoot():
	var bullet = bullet_scene.instantiate()
	bullet.position = $Ship/GunPosition.global_position
	get_parent().add_child(bullet)
	
	can_shoot = false
	$Ship/ShootCDTimer.start()

func _on_shoot_cd_timer_timeout():
	can_shoot = true
