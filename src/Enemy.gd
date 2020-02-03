extends KinematicBody

const move_velocity = 11.0

var accel: float = -9.81
var velocity: Vector3 = Vector3()
var targeting: Spatial = null

func _physics_process(delta):
	if targeting != null:
		look_at(targeting.global_transform.origin, Vector3(0, 1, 0))
		velocity = (targeting.global_transform.origin - global_transform.origin).normalized()*move_velocity
	velocity.y += accel*delta
	
	velocity = move_and_slide(velocity, Vector3(0, 1, 0))


func _on_DetectionArea_body_entered(body):
	if body.is_in_group("detectable"):
		targeting = body
