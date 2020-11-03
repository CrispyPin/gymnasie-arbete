extends Spatial

export var count = 4

const chunk = preload("res://Scenes/Chunk.tscn")
var player

var has_chunks = false

func _ready():
	player = Globals.local_player
	for x in range(-count, count):
		for z in range(-count, count):
			var c = chunk.instance()
			c.name = chunk_name(x, 0, z)
			add_child(c)
			c.global_transform.origin = Vector3(x * Globals.chunk_size * Globals.voxel_size, 0, z * Globals.chunk_size * Globals.voxel_size)
			c.call_deferred("init", get_parent().generate_new)
	has_chunks = get_tree().is_network_server()


func _process(_delta):
	if Input.is_action_just_pressed("ui_home"):
		request_chunks()


remotesync func _set_voxel_networked(pos, id):
	for c in get_children():# todo: work out what chunk, only set there
		c.set_voxel(pos, id)

func set_voxel(pos, id):
	rpc("_set_voxel_networked", pos, id)

func get_chunk(x, y, z):
	return get_node(chunk_name(x,y,z))

func chunk_name(x, y, z):
	return "chunk_" + str(x) + "," + str(y) + "," + str(z)


func request_chunks():
	has_chunks = true
	for x in range(-count, count):
		for z in range(-count, count):
			rpc_id(get_network_master(), "send_chunk", get_tree().get_network_unique_id(), x, 0, z)

remote func send_chunk(id, x, y, z):
	var data = get_chunk(x, y, z).voxels
	rpc_id(id, "recieve_chunk", x, y, z, data)

remote func recieve_chunk(x, y, z, voxels):
	var c = get_chunk(x, y, z)
	c.voxels = voxels
	c._update_mesh()
	
func save(save_path):
	var dir = Directory.new()
	if !dir.dir_exists(save_path):
		dir.make_dir(save_path)
	
	for x in range(-count, count):
		for z in range(-count, count):
			var file = File.new()
			var err = file.open(save_path + chunk_name(x, 0, z) + ".vxl", File.WRITE)
			if err == OK:
				file.store_var(get_chunk(x,0,z).voxels)
				file.close()
