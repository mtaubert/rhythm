extends Node

var color_mode = false

func load_scene(name):
	get_tree().change_scene("res://Scenes/" + name + ".tscn")

func quit_game():
	get_tree().quit()