extends Path2D

onready var follow_path = $PathFollow2D

var current_offset : float = 0

export var speed = 50

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	current_offset += delta * speed
	follow_path.offset = current_offset
