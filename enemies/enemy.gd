extends Path2D

const PLAYER_GROUP = "Player"

export var speed = 50

onready var follow_path = $PathFollow2D

var current_offset : float = 0
var player_target = null

func _process(delta):
	if player_target != null:
		pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if player_target == null:
		current_offset += delta * speed
		follow_path.offset = current_offset


func _on_DetectionArea2D_body_entered(body):
	if body.is_in_group(PLAYER_GROUP):
		player_target = body


func _on_DetectionArea2D_body_exited(body):
	if body.is_in_group(PLAYER_GROUP):
		player_target = null
