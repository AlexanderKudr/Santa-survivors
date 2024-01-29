extends CharacterBody2D

@export var speed = 100
@onready var timer: Timer = $DefaultAttack/Cooldown
@onready var marker: Marker2D = $DefaultAttack/Marker2D 

var bullet_path = preload("res://Player/Attacks/Default/default_attack.tscn")

var is_flipped = false

func movement(motion: Vector2) -> Vector2:
	if Input.is_action_pressed("move_right"):
		motion.x += 1
	if Input.is_action_pressed("move_left"):
		motion.x -= 1
	if Input.is_action_pressed("move_down"):
		motion.y += 1
	if Input.is_action_pressed("move_up"):
		motion.y -= 1

	return motion

func player_flip(cursor_position: Vector2) -> void:
	if cursor_position.x < 0:
		$AnimatedSprite2D.flip_h = true
	else:
		$AnimatedSprite2D.flip_h = false

func play_attack_animation() -> void:
	$AnimatedSprite2D.play("attack", 0.4)

func attack() -> void:
	if timer.time_left > 0:
		return
		
	$DefaultAttack.look_at(get_global_mouse_position())
	var bullet := bullet_path.instantiate()
	marker.add_child(bullet)
	bullet.global_position = marker.global_position
	bullet.global_rotation = marker.global_rotation
	timer.start()
	play_attack_animation()

	
func _physics_process(delta: float) -> void:
	var motion = Vector2.ZERO	
	motion = movement(motion).normalized() * speed
	var cursor_position := get_local_mouse_position()  
	player_flip(cursor_position)
	
	if motion.length() > 0:
		if timer.time_left > 0:
			play_attack_animation()
		else:
			$AnimatedSprite2D.play("run")  

	else:
		if timer.time_left > 0:
			play_attack_animation()
		else:
			$AnimatedSprite2D.play("idle")
		
	position += motion * delta
	move_and_slide()

	if Input.is_action_just_pressed("attack"):
		attack()
	
