extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func play():
	SceneManager.load_scene("Game")

func show_options():
	pass

func hide_options():
	pass

func quit():
	SceneManager.quit_game()