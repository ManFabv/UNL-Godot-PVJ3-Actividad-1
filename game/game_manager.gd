extends Node2D

onready var reload_scene_timer = $ReloadSceneTimer

func _ready():
	EventManager.subscribe_to_player_won(self, "_on_game_finish")
	EventManager.subscribe_to_player_lose(self, "_on_game_finish")
	
func _on_game_finish():
	reload_scene_timer.start()

func _on_ReloadSceneTimer_timeout():
	get_tree().reload_current_scene()
