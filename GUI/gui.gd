extends Control

export(String) var win_message = "YOU WON"
export(String) var lose_message = "YOU LOSE"

onready var label = $Label
onready var show_hint_timer = $ShowHintTimer

func _ready():
	EventManager.subscribe_to_player_won(self, "_on_player_won")
	EventManager.subscribe_to_player_lose(self, "_on_player_lose")
	
func _on_player_won():
	show_hint_timer.stop()
	change_text(win_message)
	
func _on_player_lose():
	show_hint_timer.stop()
	change_text(lose_message)

func change_text(new_text):
	label.text = new_text

func _on_ShowHintTimer_timeout():
	change_text("")
