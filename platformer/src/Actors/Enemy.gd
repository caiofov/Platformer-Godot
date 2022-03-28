extends Actor

func _ready() -> void: #called once at the beginning
	set_physics_process(false) #desactivate the enemy until it shows up on the screen
	_velocity.x = -speed.x #it will start moving left instead of right
	
func _physics_process(delta: float) -> void:
	_velocity.y += gravity * delta
	if is_on_wall(): #if the enemy hits a wall, it will change its movement direction
		_velocity.x *= -1.0
	_velocity.y = move_and_slide(_velocity, FLOOR_NORMAL).y
	#_velocity.y instead of _velocity because it would change _velocity.x
	#and the enemy would not change the direction when the wall if hit
	
	
