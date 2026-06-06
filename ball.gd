extends CharacterBody2D


var speed := GlobalVar.speed_ball
var start_speed := 150


func _ready() -> void:
	velocity.y += start_speed 


func _physics_process(delta: float) -> void:

	if is_on_floor():
		velocity.y -= speed
	if position.y <= -549:
		velocity.y += speed
	if position.x >= 324:
		velocity.x -= speed
	if position.x <= -327:
		velocity.x += speed

	if velocity == Vector2.ZERO:
		velocity.y += speed
	if velocity == Vector2(clamp(velocity.x,-speed,speed),0):
		velocity.y += speed

	velocity.y = clamp(velocity.y,-speed,speed)
	velocity.x = clamp(velocity.x,-speed,speed)

	move_and_slide()



func _on_area_2d_collsion_block_area_entered(area: Area2D) -> void:
	if area.is_in_group("block_down"):
		velocity.y += speed
	if area.is_in_group("block_up"):
		velocity.y -= speed
	if area.is_in_group("block_left"):
		velocity.x -= speed
	if area.is_in_group("block_right"):
		velocity.x += speed


func _on_area_2d_collsion_block_body_entered(body: Node2D) -> void:
	if body.is_in_group("block"):
		body.quit()


func quit():
	get_parent().queue_free()
