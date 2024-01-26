extends CharacterBody2D


@onready var player = get_node("/root/World/Player")

func _physics_process(delta: float) -> void:
	velocity = position.direction_to(player.position) * 100
	move_and_slide()
	
#@export var speed = 200
#var is_flipped = false

	#var motion = Vector2.ZERO
	#if motion.length() > 0:
		#motion = motion.normalized() * speed
		#$AnimatedSprite2D.play("run")  
	#
		#if motion.x < 0:
			#$AnimatedSprite2D.flip_h = true
			#is_flipped = true
		#
		#else:
			#$AnimatedSprite2D.flip_h = false
			#is_flipped = false
		#
	#position += motion * delta
	#move_and_slide()
