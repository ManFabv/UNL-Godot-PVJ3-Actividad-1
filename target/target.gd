extends Area2D

const BOXES_GROUP = "Boxes"

func _on_target_body_entered(body):
	if body.is_in_group(BOXES_GROUP):
		EventManager.publish_player_won()
