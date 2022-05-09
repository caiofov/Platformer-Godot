extends Area2D

#onready -> calls the function before the ready function
onready var anim_player: AnimationPlayer = get_node("AnimationPlayer")

#indentifies player collision
func _on_body_entered(body: Node) -> void:
	anim_player.play("fade_out")
