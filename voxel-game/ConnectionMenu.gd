extends Panel

func _process(delta):
	if Input.is_action_just_pressed("pause_menu"):
		self.visible = !self.visible
