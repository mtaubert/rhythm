extends Node

func _ready():
	$Small_Panel/Options/Color.pressed = GameManager.color_mode
	
	$Small_Panel/Options/Difficulty/HSlider.add_item("Easy")
	$Small_Panel/Options/Difficulty/HSlider.add_item("Medium")
	$Small_Panel/Options/Difficulty/HSlider.add_item("Hard")
	$Small_Panel/Options/Difficulty/HSlider.select(GameManager.difficulty)


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


func change_difficulty(ID):
	print(ID)
	GameManager.difficulty = ID
