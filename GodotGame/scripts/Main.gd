extends Spatial

# TURN CHARACTER WITH MOUSE

var ray_origin = Vector3()
var ray_target = Vector3()

func player_face_mouse():
	var mouse_position = get_viewport().get_mouse_position()
	var camera = $PlayerCamera
	
	# ray_origin is camera origin in 3d space. ray_target, a distant point 
	# through the 3d space which we will draw a line to then use to track what targets have been hit
	ray_origin = camera.project_ray_origin(mouse_position)
	ray_target = ray_origin + camera.project_ray_normal(mouse_position) * 1000
	
	# get_world gets us details about world's physics. Such as collisions... like this target ray
	# intersection will be a dictionary full of objects the ray collided with
	var space_state = get_world().direct_space_state
	var intersection = space_state.intersect_ray(ray_origin, ray_target)
	
	if not intersection.empty():
		var pos = intersection.position
		$Player.look_at(pos, Vector3.UP)

# func camera_follow_mouse():
#	var mouse_offset = (get_viewport().get_mouse_position() - get_viewport().size / 2)
#	$PlayerCamera = lerp(Vector2($Player.position.X, $Player.position.Z), mouse_offset.normalized() * 500, mouse_offset.length() / 1000)
	
func _physics_process(delta):
	player_face_mouse()
