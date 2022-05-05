extends Path2D

const PLAYER_GROUP = "Player"

export var speed = 50
export(PackedScene) var bullet_scene = null;

onready var follow_path = $PathFollow2D
onready var shoot_timer = $ShootTimer
onready var bullet_spawn_point = $PathFollow2D/KinematicBody2D/SpawnPointNode2D

var current_offset : float = 0
var player_target = null

func _ready():
	EventManager.subscribe_to_player_won(self, "_on_game_finish")
	EventManager.subscribe_to_player_lose(self, "_on_game_finish")

func _process(_delta):
	if player_target != null:
		pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	current_offset += delta * speed
	follow_path.offset = current_offset

func _on_DetectionArea2D_body_entered(body):
	if body.is_in_group(PLAYER_GROUP):
		player_target = body
		shoot()
		shoot_timer.start()

func _on_DetectionArea2D_body_exited(body):
	if body.is_in_group(PLAYER_GROUP):
		player_target = null
		shoot_timer.stop()

func _on_ShootTimer_timeout():
	shoot()
	
func shoot():
	var bullet = bullet_scene.instance()
	get_owner().add_child(bullet)
	bullet.set_target_and_forward_direction(bullet_spawn_point.global_position, player_target)
	
func _on_game_finish():
	set_process(false)
	set_physics_process(false)
	shoot_timer.stop()
