extends Spatial

func _physics_process(delta):
	rotation.y = PI - (get_viewport().size/2.0).angle_to_point(get_viewport().get_mouse_position())

func _input(event):
	if event.is_action_pressed("g_deflect") and $Area/CollisionShape.disabled:
		$AnimationPlayer.play("deflect")
		$Area/CollisionShape.disabled = false


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "deflect":
		$Area/CollisionShape.disabled = true
