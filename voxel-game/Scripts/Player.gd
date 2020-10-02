extends KinematicBody

export var speed = 10
export var jump_power = 5
export var sensitivity_h = 1.0
export var sensitivity_v = 1.0

var velocity = Vector3()
var gravity = 10

func _input(event):
	if is_network_master():
		if event is InputEventMouseMotion:
			var angle_h = -event.relative.x * sensitivity_h * 0.002
			rotate_y(angle_h)
			var angle_v = -event.relative.y * sensitivity_v * 0.002
			angle_v = min(PI * 0.5 - $Head.rotation.x, angle_v)
			angle_v = max(PI *-0.5 - $Head.rotation.x, angle_v)
			$Head.rotate_x(angle_v)
			rpc_unreliable("update_rot", angle_h, angle_v)

puppet func update_pos(pos):
	global_transform = pos

puppet func update_rot(y, x):
	$Head.rotate_x(x)
	rotate_y(y)

func _physics_process(delta):
	if is_network_master():
		var dir = Vector3()
		if Input.is_key_pressed(KEY_W):
			dir -= transform.basis[2]
		if Input.is_key_pressed(KEY_S):
			dir += transform.basis[2]
		if Input.is_key_pressed(KEY_A):
			dir -= transform.basis[0]
		if Input.is_key_pressed(KEY_D):
			dir += transform.basis[0]

		dir.y = 0
		dir = dir.normalized() * speed
		velocity.y -= gravity * delta
		velocity.x = dir.x
		velocity.z = dir.z

		if Input.is_action_just_pressed("jump") && is_on_floor():
			velocity.y = jump_power

		velocity = move_and_slide(velocity, Vector3.UP)

		rpc_unreliable("update_pos", global_transform)

func respawn():
	global_transform.origin = Vector3(0,1,0)
	velocity = Vector3(0, 0, 0);
	rpc_unreliable("update_pos", global_transform)
