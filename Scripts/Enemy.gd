extends Sprite

var square = preload("res://Assets/Shapes/square.png")
var triangle = preload("res://Assets/Shapes/triangle.png")
var circle = preload("res://Assets/Shapes/circle.png")
var hexagon = preload("res://Assets/Shapes/hexagon.png")

var shapes = [square, triangle, circle, hexagon]
var colors = [Color("ff0000"), Color("00ff00"), Color("0000ff"), Color("d2ff00")]

var currentShape
var currentColor = "white"
var speed = 2
var direction
var dead = false
var despawning = false
var playerPos

func _ready():
	playerPos = get_tree().get_nodes_in_group("Player_Node")[0].position
	direction = Vector2(playerPos-self.global_position)/500
	randomize()
	set_shape()
	if GameManager.color_mode:
		set_color()
	$AnimationPlayer.play("spawn")

func set_shape():
	var rand = randi() % 4
	self.texture = shapes[rand]
	match rand:
		0:
			currentShape = "square"
		1:
			currentShape = "triangle"
		2:
			currentShape = "circle"
		3:
			currentShape = "hexagon"

func set_color():
	var rand = randi() % 4
	self.modulate = colors[rand]
	match rand:
		0:
			currentColor = "red"
		1:
			currentColor = "green"
		2:
			currentColor = "blue"
		3:
			currentColor = "yellow"

func _process(delta):
	if not dead:
		moveToPlayer()
	elif not despawning:
		$AnimationPlayer.play("death")
		dead = true
		despawning = true

func moveToPlayer():
	
	self.position += direction*speed

func die():
	dead = true

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "death":
		queue_free()
