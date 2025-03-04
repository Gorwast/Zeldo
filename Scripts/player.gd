extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	var directionTop := Input.get_axis("ui_up", "ui_down")
	if direction or directionTop:
		if direction < 0:
			$AnimatedSprite2D.flip_h = false
		else: 
			$AnimatedSprite2D.flip_h = true
		velocity.x = direction * SPEED
		velocity.y = directionTop * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()
