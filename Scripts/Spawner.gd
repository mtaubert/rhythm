extends Node

var enemy = preload("res://Scenes/Prefabs/enemy.tscn")
onready var timer = $Timer
var spawnRate = 2
var enemySpeed = 4

func _ready():
	timer.set_wait_time(spawnRate)
	timer.start()
	randomize()

func spawn_enemy():
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

func reset():
	spawnRate = 2
	enemySpeed = 4
	timer.set_wait_time(spawnRate)