tool
extends Sprite

export(float) var forward_line_length = 30
export(float) var forward_line_width = 4

var forward_line = Vector2.ZERO

func _ready():
	if Engine.editor_hint:
		forward_line = Vector2.RIGHT * forward_line_length

func _draw():
	if Engine.editor_hint:
		draw_line(self.position, self.position + forward_line, Color.red, forward_line_width, true)
