extends Node2D

const scroll_speed : int = 80

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if position.x <= -1152:
		position.x = 0
	position.x -= scroll_speed * delta
