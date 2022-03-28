extends KinematicBody2D

#class which both player and enemy will extend
class_name Actor

const FLOOR_NORMAL: = Vector2.UP #vector that defines the floor (it will be used later)
#UP -> (0,-1) -> vector pointing up

export var speed: = Vector2(300.0, 1000.0)
export var gravity: = 3000.0
#export -> makes the gravity configurable. It will be displayed on the right view inspector
var _velocity: = Vector2.ZERO #velocity in each axis


#calls it every frame in our game
#verything that envolves physics: collision etc
func _physics_process(delta: float) -> void:
	#delta -> time elapsed since the last frame (the engine will give it to us)
	pass
	#_velocity.y = max(_velocity.y, speed.y) #sets the max velocity

