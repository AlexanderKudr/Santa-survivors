extends CharacterBody2D

var enemy_chase_player = false
const SPEED = 75
@onready var santa = get_node("../Santa_body")

func _physics_process(_delta):
	var anim = get_node("AnimatedSprite2D")
	if enemy_chase_player:
		anim.play("Charge")
		var direction = (santa.global_position - self.global_position).normalized()
		
		anim.flip_h = direction.x < 0
		velocity = direction * SPEED
	else:
		anim.play("Slimes idle")
		velocity = Vector2.ZERO
	move_and_slide()


func _on_slime_area_body_entered(body):
	if body.name == "Santa_body":
		enemy_chase_player = true


func _on_slime_area_body_exited(body):
	if body.name == "Santa_body":
		enemy_chase_player = false
