extends KinematicBody

export var speed = 5
var velocity = Vector3()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	velocity = Vector3()
	
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_up"):
		velocity.z -= 1
	if Input.is_action_pressed("move_down"):
		velocity.z += 1
		
	velocity = velocity.normalized() * speed
	move_and_slide(velocity)
