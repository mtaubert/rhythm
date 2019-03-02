extends Node

var enemy = preload("res://Scenes/Prefabs/enemy.tscn")
onready var timer = $Timer
var spawnRate = 2
var enemySpeed = 4
var radius = 500
var center

func _ready():
	center = get_tree().get_nodes_in_group("Player_Node")[0].position
	timer.set_wait_time(spawnRate)
	timer.start()
	randomize()

func spawn_enemy_old():
	var rand = randi() % 4
	var spawnPoint = self.get_child(rand)
	var enemyInstance = enemy.instance()
	enemyInstance.set_name("enemy")
	enemyInstance.speed = enemySpeed
	spawnPoint.add_child(enemyInstance)
	
	if spawnRate > 0.5:
		spawnRate -= 0.1
	enemySpeed += 0.1
	timer.set_wait_time(spawnRate)

var angles = [0, 90, 180, 270, 45, 135, 225, 315]
func spawn_enemy():
	var randAngle
	if GameManager.difficulty == 0:
		randAngle = randi() % 4
		randAngle = angles[randAngle]
	elif GameManager.difficulty == 1:
		randAngle = randi() % 8
		randAngle = angles[randAngle]
	elif GameManager.difficulty == 2:
		randAngle = randi() % 360
	
	print(randAngle)
	
	var offset = Vector2(sin(deg2rad(randAngle)), cos(deg2rad(randAngle))) * radius
	var spawn = center + offset
	var enemyInstance = enemy.instance()
	enemyInstance.set_name("enemy")
	enemyInstance.speed = enemySpeed
	enemyInstance.position = spawn
	$Enemies.add_child(enemyInstance)

func reset():
	spawnRate = 2
	enemySpeed = 4
	timer.set_wait_time(spawnRate)