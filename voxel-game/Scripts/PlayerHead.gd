extends Spatial

var player

const epsilon = 0.001

func _ready():
	player = get_parent()


func _physics_process(_delta):
	if is_network_master():
		if Input.is_action_just_pressed("break_voxel"):
			var result = raycast()
			if result:
				call_deferred("player.break_voxel", result.position - global_transform.basis.z * epsilon)
		

func raycast():
	var space_state = get_world().direct_space_state
	return space_state.intersect_ray(global_transform.origin, global_transform.origin - global_transform.basis.z * player.reach, [player.get_node("BodyCollider")])
