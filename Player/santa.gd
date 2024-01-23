extends CharacterBody2D

@export var speed = 200

func _physics_process(delta: float) -> void:
	var motion = Vector2.ZERO
	if Input.is_action_pressed("move_right"):
		motion.x += 1
	if Input.is_action_pressed("move_left"):
		motion.x -= 1
	if Input.is_action_pressed("move_down"):
		motion.y += 1
	if Input.is_action_pressed("move_up"):
		motion.y -= 1

	if motion.length() > 0:
		motion = motion.normalized() * speed
		
	position += motion * delta
