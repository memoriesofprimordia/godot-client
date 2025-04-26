extends Control

@export var grid_size := Vector2i(20, 20)  # Match your TileMap dimensions
@export var cell_size := 32                 # Match your tile size
@export var line_color := Color.WHITE
@export var line_width := 1.0
@export var hover_color := Color(1, 1, 1, 0.2)



func _ready():
	# Set Control size to cover the entire grid
	size = Vector2(grid_size) * cell_size

func _draw():
	# Draw grid lines
	for x in grid_size.x + 1:
		draw_line(
			Vector2(x * cell_size, 0),
			Vector2(x * cell_size, grid_size.y * cell_size),
			line_color,
			line_width
		)
	for y in grid_size.y + 1:
		draw_line(
			Vector2(0, y * cell_size),
			Vector2(grid_size.x * cell_size, y * cell_size),
			line_color,
			line_width
		)
