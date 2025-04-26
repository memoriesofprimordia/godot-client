extends Control

@onready var grid_renderer: Control = $"../GridRenderer"
@export var cell_size := 32
@export var line_width := 1.0
@export var hover_color := Color(0, 1, 0, 0.2)
var hovered_cell := Vector2i(-1, -1)

func _ready():
	mouse_filter = MOUSE_FILTER_PASS

func _gui_input(event):
	if event is InputEventMouseMotion:
		var mouse_pos = get_global_mouse_position()
		print(mouse_pos)
		var new_hovered_cell = Vector2i(mouse_pos.x / cell_size, mouse_pos.y / cell_size)
		if new_hovered_cell != hovered_cell:
			print("moveu 2")
			hovered_cell = new_hovered_cell
			queue_redraw()

func _draw():
	var rect = Rect2(hovered_cell * cell_size, Vector2.ONE * cell_size)
	print("desenhou")
	print(hovered_cell)
	draw_rect(rect, hover_color, true)
