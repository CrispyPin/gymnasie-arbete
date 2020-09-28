extends Panel

var player

func _ready():
	player = get_node("../Player")
	visible = false

func _process(_delta):
	update_pos()
	update_vel()
	
	if Input.is_action_just_pressed("debug_overlay_toggle"):
		visible = !visible

func update_pos():
	$Position.text = "Position XYZ:\n"
	$Position.text += str(player.global_transform.origin.x) + "\n"
	$Position.text += str(player.global_transform.origin.y) + "\n"
	$Position.text += str(player.global_transform.origin.z) + "\n"
	
func update_vel():
	$Velocity.text = "Velocity XYZ:\n"
	$Velocity.text += str(player.velocity.x) + "\n"
	$Velocity.text += str(player.velocity.y) + "\n"
	$Velocity.text += str(player.velocity.z) + "\n"
