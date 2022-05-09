extends Node2D

onready var score_text: Label = get_node("CanvasLayer/Score")
var score_count = 0

func add_score()->void:
	score_count += 1
	score_text.set_text("Coins:\n"+str(score_count))


