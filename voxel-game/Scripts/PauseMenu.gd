extends Node

var player

func _ready():
	player = Globals.local_player
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	self.visible = false


func _process(_delta):
	if Input.is_action_just_pressed("pause_menu"):
		self.visible = !self.visible
		if self.visible:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			get_tree().paused = true
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
			get_tree().paused = false



func _on_RespawnButton_pressed():
	Globals.local_player.respawn()


func _on_ExitBtn_pressed():
	get_tree().set_network_peer(null)
	get_tree().quit()
