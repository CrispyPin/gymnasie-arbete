extends Spatial

export var count = 4

const chunk = preload("res://Scenes/Chunk.tscn")
var player

func _ready():
	player = Globals.local_player
	for x in range(-count, count):
		for z in range(-count, count):
			var c = chunk.instance()
			add_child(c)
			c.global_transform.origin = Vector3(x * Globals.chunk_size * Globals.voxel_size, 0, z * Globals.chunk_size * Globals.voxel_size)
			c.init()

func set_voxel(pos, id):#todo work out what chunk, only set there
	for c in get_children():
		c.set_voxel(pos, id)
