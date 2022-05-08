extends Actor

func _ready() -> void: #called once at the beginning
	set_physics_process(false) #desactivate the enemy until it shows up on the screen
	_velocity.x = -speed.x #it will start moving left instead of right

#function connected to the stomp detector of the enemy (we added it through the "node" tab of the stomp detector and clicking on area_entered)
func _on_StompDetector_body_entered(body: Node) -> void:
	#body -> body which entered in the area (player's body)
	if body.global_position.y > get_node("StompDetector").global_position.y: #if the player is bellow the enemy
		return #stops the funcion
	get_node("CollisionShape2D").disabled = true #disables the collision of the enemy in order to not hit the player
	queue_free() #kills the enemy - deletes the node
	

func _physics_process(delta: float) -> void:
	_velocity.y += gravity * delta
	if is_on_wall(): #if the enemy hits a wall, it will change its movement direction
		_velocity.x *= -1.0
	_velocity.y = move_and_slide(_velocity, FLOOR_NORMAL).y
	#_velocity.y instead of _velocity because it would change _velocity.x to zero
	#and the enemy would not change the direction when the wall if hit

