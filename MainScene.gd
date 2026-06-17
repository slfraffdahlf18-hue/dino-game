extends Node

@export var Stump : PackedScene

const scroll_speed : int = 500
var score : int = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	score = score + delta * 100
	$UI/Score.text = str(score)
	for obstacle in get_tree().get_nodes_in_group("Obstacles"):
		if obstacle.position.x <= -1152:
			obstacle.position.x = 0
		obstacle.position.x -= scroll_speed * delta
		

func _on_obstacle_stump_timer_timeout() -> void:
	var random : int = randi() % 04 #output rather 0, 1, 2
	var obstacles_instance : Area2D = Stump.instantiate()
	add_child(obstacles_instance)
	obstacles_instance.body_entered.connect(_on_obstacle_collided.bind(obstacles_instance))
	obstacles_instance.body_entered.connect(_on_binwall_collided.bind(obstacles_instance))
	obstacles_instance.position.x = 2000 + random * 200
	obstacles_instance.position.y = 570 
	
func _on_obstacle_collided(body: Node2D, obstacle: Area2D):
	if body.is_in_group("Player"):
		get_tree().change_scene_to_file("res://gameover.tscn")
		
func _on_binwall_collided(body: Node2D, instance: Area2D):
	if body.is_in_group("BinWall"):
		instance.queue_free()
