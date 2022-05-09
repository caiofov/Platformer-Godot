tool
extends Area2D

onready var anim_player: AnimationPlayer = get_node("AnimationPlayer")

export var next_scene: PackedScene #.tscn file (scene file)

#when the player gets in the portal, this function will call the teleport function
func _on_body_entered(body: Node) -> void:
	teleport()

#setting up warnings in the editor
func _get_configuration_warning() -> String:
	return "The next scene property can't be empty" if not next_scene else ""
	#displays a warning if there's no next scene

func teleport()-> void:
	anim_player.play("fade_in")
	#yield -> waits for something before continuing the function
	yield(anim_player, "animation_finished") #waits for the animation stop
	
	#scene tree -> object that store the entire scene of the game
	get_tree().change_scene_to(next_scene) #teleports the player for the next scene
