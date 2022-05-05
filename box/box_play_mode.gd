tool
extends Sprite

export(float) var highlight_radius = 10

var vertical_offset = 0

func _ready():
	vertical_offset = Vector2.UP * highlight_radius * 2

func _draw():
	if Engine.editor_hint:
		draw_circle(self.position + vertical_offset, highlight_radius, Color.red)
