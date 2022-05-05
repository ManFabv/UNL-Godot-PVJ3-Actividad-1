extends Area2D

const PLAYER_GROUP = "Player"
const LEVEL_GROUP = "Level"
const BOXES_GROUP = "Boxes"

export var motion_speed : float = 100

var forward_direction = Vector2()

func set_target_and_forward_direction(spawn_position, target):
	position = spawn_position
	look_at(target.global_position)
	forward_direction = Vector2.RIGHT.rotated(rotation)
	
func _physics_process(delta):
	position += forward_direction * motion_speed * delta

func _on_DetectionArea2D_body_entered(body):
	if body.is_in_group(PLAYER_GROUP):
		print("lose")
	
	if body.is_in_group(PLAYER_GROUP) or body.is_in_group(LEVEL_GROUP) or body.is_in_group(BOXES_GROUP):
		queue_free()
