extends KinematicBody

const move_velocity = 7.0

var accel: float = -9.81
var velocity: Vector3 = Vector3()
var rot_velocity: float = 0.0

func _physics_process(delta):
	rot_velocity = float(Input.is_action_pressed("g_turn_right")) - float(Input.is_action_pressed("g_turn_left"))
	rot_velocity *= -10.0
	
	var input_vector: Vector2 = Vector2(\
		float(Input.is_action_pressed("g_right")) - float(Input.is_action_pressed("g_left")), \
		float(Input.is_action_pressed("g_up")) - float(Input.is_action_pressed("g_down")) \
	).rotated(rotation.y)
	
	velocity.x = input_vector.x
	velocity.z = input_vector.y
	velocity.y += accel*delta
	
	velocity = move_and_slide(velocity, Vector3(0, 1, 0))
	rotation.y += rot_velocity*delta
