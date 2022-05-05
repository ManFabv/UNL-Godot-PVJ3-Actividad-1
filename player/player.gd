extends KinematicBody2D

export var motion_speed : float = 160 # Pixels/second
export var push_force : float = 20

var motion : Vector2 = Vector2.ZERO

const FLOOR_MAX_ANGLE = PI/4
const MAX_SLIDES = 4
const BOXES_GROUP = "Boxes"

func _ready():
	EventManager.subscribe_to_player_won(self, "_on_game_finish")
	EventManager.subscribe_to_player_lose(self, "_on_game_finish")

func _process(_delta):
	motion.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	motion.y = Input.get_action_strength("move_bottom") - Input.get_action_strength("move_up")
	
	motion = motion.normalized() * motion_speed
	
func _physics_process(_delta):
	motion = move_and_slide(motion, Vector2.UP, false, MAX_SLIDES, FLOOR_MAX_ANGLE, false)
	process_push_boxes()
	
func process_push_boxes():
	for index in get_slide_count():
		var current_collision = get_slide_collision(index)
		var current_collider = current_collision.collider
		
		if current_collider.is_in_group(BOXES_GROUP):
			current_collider.apply_central_impulse(-current_collision.normal * push_force)

func _on_game_finish():
	set_process(false)
	set_physics_process(false)
