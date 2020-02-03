extends KinematicBody

var accel: Vector3 = Vector3(0.0, -9.81, 0.0)
var velocity: Vector3 = Vector3()

func _physics_process(delta):
	
	velocity += accel*delta
	velocity = move_and_slide(velocity, Vector3(0, 1, 0))
