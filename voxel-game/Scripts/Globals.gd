extends Node

var local_player
export var players = []

const chunk_size = 16 # voxels cubed in each chunk
const voxel_size = .25 # unit size of each voxel

var uv_ids = []

func _ready():
	for y in range(1, 17):
		for x in range(1, 17):
			uv_ids.append([
				Vector2(.0625*(x-1), .0625*y),
				Vector2(.0625*(x-1), .0625*(y-1)),
				Vector2(.0625*x, .0625*(y-1)),
				Vector2(.0625*x, .0625*y)
			])
