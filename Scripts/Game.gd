extends Node

var gameOver = false
var restarting = false

var score = 0

func _ready():
	$Player.connect("died", self, "game_over")
	$Player.connect("point", self, "add_point")
	$Background/Score/Label.text = "Score: 0"

func _process(delta):
	if(Input.is_key_pressed(KEY_R) and gameOver and not restarting):
		restarting = true
		gameOver = false
		$Background/Score/Label.text = "Score: 0"
		$AnimationPlayer.play("restart")
		$Player.respawn()
		$Spawns.timer.start()

func game_over():
	gameOver = true
	$AnimationPlayer.play("game_over")
	$Spawns.timer.stop()
	$Spawns.reset()
	
	for enemy in get_tree().get_nodes_in_group("Enemies"):
		enemy.die()

func add_point():
	score += 1
	$Background/Score/Label.text = "Score: " + String(score)

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "restart":
		restarting = false
