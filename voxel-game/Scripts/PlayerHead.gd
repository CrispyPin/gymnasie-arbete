extends Spatial

var player

const surface_offset = 0.01

export var repeat_delay = 0.1
var since_repeat_b = 0# break
var since_repeat_p = 0# place

func _ready():
	player = get_parent()


func _physics_process(delta):
	if is_network_master():
		if Input.is_action_pressed("break_voxel"):
			since_repeat_b += delta
			if since_repeat_b >= repeat_delay or Input.is_action_just_pressed("break_voxel"):
				since_repeat_b = 0
				_break_voxel()
		if Input.is_action_pressed("place_voxel"):
			since_repeat_p += delta
			if since_repeat_p >= repeat_delay or Input.is_action_just_pressed("place_voxel"):
				since_repeat_p = 0
				_place_voxel()

func _place_voxel():
	var result = _raycast()
	if result:
		player.place_voxel(result.position + result.normal * surface_offset)

func _break_voxel():
	var result = _raycast()
	if result:
		player.break_voxel(result.position - result.normal * surface_offset)

func _raycast():
	var space_state = get_world().direct_space_state
	return space_state.intersect_ray(global_transform.origin, global_transform.origin - global_transform.basis.z * player.reach, [player])
