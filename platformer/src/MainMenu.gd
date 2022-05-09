extends Control

func _ready() -> void:
	$VBoxContainer/StartButton.grab_focus() #start point for the keyboard focus

#changes to the first level
func _on_StartButton_pressed() -> void:
	get_tree().change_scene("res://src/Levels/Level01.tscn")

#quits the game
func _on_QuitButton_pressed() -> void:
	get_tree().quit()
