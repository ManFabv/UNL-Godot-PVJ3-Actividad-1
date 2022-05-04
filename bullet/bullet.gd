extends Area2D

const PLAYER_GROUP = "Player"

export var motion_speed : float = 100
	
func _physics_process(delta):
	position += Vector2.RIGHT.rotated(rotation) * motion_speed * delta

func _on_DetectionArea2D_body_entered(body):
	if body.is_in_group(PLAYER_GROUP):
		pass # Replace with function body.
	queue_free()
