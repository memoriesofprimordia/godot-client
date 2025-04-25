extends CharacterBody2D

const TILE_SIZE = 32  # Match your tile size
var target_position: Vector2
var is_moving = false

func _ready():
	target_position = position  # Start at current position

func _input(event):
	if event.is_action_pressed("click") and not is_moving:
		target_position = get_global_mouse_position().snapped(Vector2.ONE * TILE_SIZE)

func _physics_process(delta):
	if position.distance_to(target_position) > 1:
		is_moving = true
		position = position.move_toward(target_position, TILE_SIZE / 10.0)  # Adjust speed
	else:
		is_moving = false
