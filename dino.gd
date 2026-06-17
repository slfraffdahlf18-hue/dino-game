extends CharacterBody2D

const GRAVITY : int = 5000
const JUMP_SPEED : int = -1500

func _physics_process(delta):
	velocity.y += GRAVITY * delta
	if is_on_floor():
		$RunCol.disabled = false
		if Input.is_action_pressed("ui_accept"):
			velocity.y = JUMP_SPEED
			$JumpSound.play()
		elif Input.is_action_pressed("ui_down"):
			$AnimatedSprite2D.play("Duck")
			$RunCol.disabled = true
		else:
			$AnimatedSprite2D.play("Run")
	else:
		$AnimatedSprite2D.play("Jump")
		
	move_and_slide()


func _on_button_pressed() -> void:
	if is_on_floor():
		velocity.y = JUMP_SPEED
		$JumpSound.play()
		move_and_slide()
