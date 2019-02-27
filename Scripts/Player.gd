extends Sprite

var square = preload("res://Assets/Shapes/square.png")
var triangle = preload("res://Assets/Shapes/triangle.png")
var circle = preload("res://Assets/Shapes/circle.png")
var hexagon = preload("res://Assets/Shapes/hexagon.png")

var currentShape

signal died()
signal point()

func _ready():
	self.texture = square
	currentShape = "square"

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

func _on_Area2D_area_shape_entered(area_id, area, area_shape, self_shape):
	var hitEnemy = area.get_parent()
	
	if hitEnemy.currentShape == currentShape:
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