extends CharacterBody2D

@onready var player := get_node("/root/World/Player") 
@onready var animation: AnimationPlayer = $AnimationPlayer
@export var speed := 25

var is_flipped = false
var is_attacking = false


func _physics_process(delta: float) -> void:
	velocity = position.direction_to(player.position) * speed
	print(position, ' here is the init pos')
	position += velocity * delta
	
	if velocity.length() > 0:
		animation.play("run")  
		
		if velocity.x < 0:
			$Sprite2D.flip_h = true
			is_flipped = true
			
		else:
			$Sprite2D.flip_h = false
			is_flipped = false
			
	move_and_slide()
	attack(delta)
	
func attack(delta: float) -> void:
	if position.distance_to(player.position) < 100:
		animation.play("attack")
		velocity = position.direction_to(player.position) * speed    
		print("testo", animation.current_animation_length)
