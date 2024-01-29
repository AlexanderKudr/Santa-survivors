extends CharacterBody2D


@onready var player = get_node("/root/World/Player")
@export var speed = 25

var is_flipped = false
func _physics_process(delta: float) -> void:
	velocity = position.direction_to(player.position) * speed
	move_and_slide()
	

	if velocity.length() > 0:
		$AnimationPlayer.play("run")  
	
		if velocity.x < 0:
			$Sprite2D.flip_h = true
			is_flipped = true
		
		else:
			$Sprite2D.flip_h = false
			is_flipped = false
		
	position += velocity * delta
	move_and_slide()
