extends Panel

var player

func _ready():
	player = Globals.local_player
	visible = false
	$NetworkStatus.text = "Playing on server"
	if get_tree().is_network_server():
		$NetworkStatus.text = "Hosting server"

func _process(_delta):
	if visible:
		update_pos()
		update_rot()

	if Input.is_action_just_pressed("debug_overlay_toggle"):
		visible = !visible

func update_pos():
	$Position.text = "Position XYZ:\n"
	$Position.text += str(Globals.local_player.global_transform.origin.x) + "\n"
	$Position.text += str(Globals.local_player.global_transform.origin.y) + "\n"
	$Position.text += str(Globals.local_player.global_transform.origin.z) + "\n"

func update_rot():
	$Rotation.text = "Pitch: " + str(Globals.local_player.get_node("Head").rotation.x) + "\n"
	$Rotation.text +="Yaw:   " + str(Globals.local_player.rotation.y)
