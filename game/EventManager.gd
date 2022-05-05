extends Node2D

const PLAYER_LOSE_SIGNAL_NAME = "player_lose"
const PLAYER_WON_SIGNAL_NAME = "player_won"

signal player_lose;
signal player_won;

func subscribe_to_player_won(receiver, method: String):
	subscribe_to_signal(PLAYER_WON_SIGNAL_NAME, receiver, method)
	
func subscribe_to_player_lose(receiver, method: String):
	subscribe_to_signal(PLAYER_LOSE_SIGNAL_NAME, receiver, method)
	
func publish_player_won():
	emit_signal(PLAYER_WON_SIGNAL_NAME)
	
func publish_player_lose():
	emit_signal(PLAYER_LOSE_SIGNAL_NAME)

func subscribe_to_signal(signal_name: String, receiver, method: String):
	connect(signal_name, receiver, method)

func publish_signal(signal_name: String):
	emit_signal(signal_name)
