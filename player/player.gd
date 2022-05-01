extends KinematicBody2D

export var MOTION_SPEED : float = 160 # Pixels/second

var motion : Vector2 = Vector2.ZERO

func _process(_delta):
	motion.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	motion.y = Input.get_action_strength("move_bottom") - Input.get_action_strength("move_up")
	
	motion = motion.normalized()*MOTION_SPEED
	
func _physics_process(_delta):
	motion = move_and_slide(motion)
