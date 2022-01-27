extends Camera


const MAX_CAMERA_DISTANCE := 50.0
const MAX_CAMERA_PERCENT := 0.1
const CAMERA_SPEED := 0.1


export (NodePath) onready var player = get_node(player)
export (NodePath) onready var camera = get_node(camera)


func _process(_delta: float) -> void:
	var viewport := get_viewport()
	var viewport_center := viewport.size / 2.0
	var direction := viewport.get_mouse_position() - viewport_center
	var percent := (direction / viewport.size * 2.0).length()

	var camera_position: Vector2
	var vec2 = Vector2(2, 2)
	if percent < MAX_CAMERA_PERCENT:
		camera_position = vec2 + direction.normalized() * MAX_CAMERA_DISTANCE * (percent / MAX_CAMERA_PERCENT)
	else:
		camera_position = vec2 + direction.normalized() * MAX_CAMERA_DISTANCE

	camera = lerp(vec2, camera_position, CAMERA_SPEED)
