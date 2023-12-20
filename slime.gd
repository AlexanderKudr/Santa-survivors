extends CharacterBody2D

var chase = false
const SPEED = 75

func _physics_process(delta):
	var anim = get_node("AnimatedSprite2D")
	if chase:
		anim.play("Charge")
		var santa = get_node("../Santa_body")
		var direction = (santa.position - self.position).normalized()
		
		anim.flip_h = direction.x < 0
		velocity = direction * SPEED
	else:
		anim.play("Slimes idle")
		velocity = Vector2.ZERO
	move_and_slide()

func _on_slime_detection_area_body_exited(body):
	if body.name == "Santa_body":
		chase = false

func _on_slime_detection_area_body_entered(body):
	if body.name == "Santa_body":
		chase = true
