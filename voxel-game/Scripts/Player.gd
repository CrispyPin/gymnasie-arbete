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
			rotate_y(-event.relative.x * sensitivity_h * 0.002)
			var angle_v = -event.relative.y * sensitivity_v * 0.002
			angle_v = min(PI * 0.5 - $Camera.rotation.x, angle_v)
			angle_v = max(PI *-0.5 - $Camera.rotation.x, angle_v)
			$Camera.rotate_x(angle_v)

slave func set_position(pos):
	global_transform = pos


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

		rpc_unreliable("set_position", global_transform)
