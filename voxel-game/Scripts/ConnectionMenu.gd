extends Panel

func _process(_delta):
	if Input.is_action_just_pressed("pause_menu"):
		self.visible = !self.visible
		if self.visible:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

