extends KinematicBody

export var speed = 10
export var jump_power = 5
export var sensitivity_h = 1.0
export var sensitivity_v = 1.0

var velocity = Vector3()
var gravity = 10

func _ready():
	pass

func _input(event):
	if event is InputEventMouseMotion:
		rotate_y(-event.relative.x * sensitivity_h * 0.002)
		var angle_v = -event.relative.y * sensitivity_v * 0.002
		angle_v = min(PI * 0.5 - $Camera.rotation.x, angle_v)
		angle_v = max(PI *-0.5 - $Camera.rotation.x, angle_v)
		$Camera.rotate_x(angle_v)

func _physics_process(delta):
	
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
	velocity.y = max(velocity.y, -100)
	velocity.x = dir.x
	velocity.z = dir.z
	
	if Input.is_action_just_pressed("jump"):# && velocity.y == 0:
		velocity.y = jump_power
	
	move_and_slide(velocity)
	


func _on_RespawnButton_pressed():
	global_transform.origin = Vector3(0,1,0)
