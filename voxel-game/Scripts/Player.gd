extends Spatial


export var speed = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	var vel = Vector3()
	if Input.is_key_pressed(KEY_W):
		vel.x += speed
	
