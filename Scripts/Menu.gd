extends Node

func _ready():
	$Small_Panel/Options/Color.pressed = GameManager.color_mode

func play():
	GameManager.load_scene("Game")

func show_options():
	$Small_Panel/Options.show()
	$Small_Panel/Buttons.hide()

func hide_options():
	$Small_Panel/Options.hide()
	$Small_Panel/Buttons.show()

func quit():
	GameManager.quit_game()

func color_mode(button_pressed):
	GameManager.color_mode = button_pressed
