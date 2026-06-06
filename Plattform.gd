extends CharacterBody2D



const FRICCION := 900


func _physics_process(delta: float) -> void:
	var aceleration := GlobalVar.speed_plattform
	var max_speed = aceleration * 1.5 
	velocity.y = 0
	var direction := 0
	if Input.is_action_pressed("ui_right"):
		direction += 1
	if Input.is_action_pressed("ui_left"):
		direction -= 1

	if direction != 0:
		velocity.x = direction * aceleration
	else:
		velocity.x = move_toward(velocity.x,0,FRICCION * delta)

	velocity.x = clamp(velocity.x,-max_speed,max_speed)

	move_and_slide()
