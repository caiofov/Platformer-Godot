extends Actor

#also runs the parent's physics process
func _physics_process(delta: float) -> void:
	var is_jump_interrupted: = Input.is_action_just_released("jump") and _velocity.y < 0.0
	#jump button has just been released and the character is moving up (jumping)
	#it indentifies if the player has stopped jumping
	
	var direction: = get_direction()
	
	_velocity = calculate_move_velocity(_velocity, direction, speed, is_jump_interrupted)
	_velocity = move_and_slide(_velocity, FLOOR_NORMAL) #2nd parameter -> floor normal: a vector that defines the floor
	
	
func get_direction() -> Vector2:
	#we have definied those actions in settings
	#get_action_strength returns a value between 0 and 1 (0 for not pressed at all and 1 for full pressed)
	return Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		-1.0 if Input.is_action_just_pressed("jump") and is_on_floor() else 1.0 #if the player has jumped, so it will move up. Otherwise, it will fall
	)
	#is_on_floor() -> returns if the character is on the floor

func calculate_move_velocity(
		linear_velocity: Vector2,
		direction: Vector2,
		speed: Vector2,
		is_jump_interrupted: bool
	) -> Vector2:
		var out: = linear_velocity
		
		out.x = speed.x * direction.x
		out.y += gravity * get_physics_process_delta_time() #returns the delta from the physics_process
		
		if direction.y == -1.0:
			out.y = speed.y * direction.y
		if is_jump_interrupted:
			out.y = 0.0 #it makes the character stop jumping in the middle of a jump when the key is released
		
		return out
