extends Node

var enemy = preload("res://Scenes/Prefabs/enemy.tscn")
onready var timer = $Timer
var spawnRate = 1
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

func spawn_enemy():
	var randAngle = randi() % 360
	var offset = Vector2(sin(randAngle), cos(randAngle)) * radius
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