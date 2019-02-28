extends Sprite

var square = preload("res://Assets/Shapes/square.png")
var triangle = preload("res://Assets/Shapes/triangle.png")
var circle = preload("res://Assets/Shapes/circle.png")
var hexagon = preload("res://Assets/Shapes/hexagon.png")

var red = Color("ff0000")
var green = Color("00ff00")
var blue = Color("0000ff")
var yellow = Color("d2ff00")

var currentShape
var currentColor = "white"

signal died()
signal point()

func _ready():
	self.texture = square
	currentShape = "square"
	
	if GameManager.color_mode:
		self.modulate = red
		currentColor = "red"


func _process(delta):
	if(Input.is_action_pressed("ui_left") and currentShape != "square"):
		self.texture = square
		currentShape = "square"
		$AnimationPlayer.play("change_shape")
	elif(Input.is_action_pressed("ui_up") and currentShape != "triangle"):
		self.texture = triangle
		currentShape = "triangle"
		$AnimationPlayer.play("change_shape")
	elif(Input.is_action_pressed("ui_right") and currentShape != "circle"):
		self.texture = circle
		currentShape = "circle"
		$AnimationPlayer.play("change_shape")
	elif(Input.is_action_pressed("ui_down") and currentShape != "hexagon"):
		self.texture = hexagon
		currentShape = "hexagon"
		$AnimationPlayer.play("change_shape")
	
	if GameManager.color_mode:
		if(Input.is_action_pressed("color_a") and currentColor != "red"):
			self.modulate = red
			currentColor = "red"
			$AnimationPlayer.play("change_shape")
		elif(Input.is_action_pressed("color_w") and currentColor != "green"):
			self.modulate = green
			currentColor = "green"
			$AnimationPlayer.play("change_shape")
		elif(Input.is_action_pressed("color_d") and currentColor != "blue"):
			self.modulate = blue
			currentColor = "blue"
			$AnimationPlayer.play("change_shape")
		elif(Input.is_action_pressed("color_s") and currentColor != "yellow"):
			self.modulate = yellow
			currentColor = "yellow"
			$AnimationPlayer.play("change_shape")

func _on_Area2D_area_shape_entered(area_id, area, area_shape, self_shape):
	var hitEnemy = area.get_parent()
	
	if hitEnemy.currentShape == currentShape and hitEnemy.currentColor == currentColor:
		hitEnemy.die()
		emit_signal("point")
	else:
		game_over()
		hitEnemy.die()

func game_over():
	emit_signal("died")
	$AnimationPlayer.play("died")

func respawn():
	self.texture = square
	currentShape = "square"
	$AnimationPlayer.play("respawn")