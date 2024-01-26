extends CharacterBody2D

@export var speed = 200
var is_flipped = false
		
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
		$AnimatedSprite2D.play("run")  
		
		if motion.x < 0:
			$AnimatedSprite2D.flip_h = true
			is_flipped = true
		
		else:
			$AnimatedSprite2D.flip_h = false
			is_flipped = false
			
	else:
		if motion and is_flipped:
			$AnimatedSprite2D.play("idle_left")
		else:
			$AnimatedSprite2D.play("idle_right")
		
	position += motion * delta
	move_and_slide()


