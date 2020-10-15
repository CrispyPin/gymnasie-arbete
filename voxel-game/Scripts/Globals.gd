extends Node

var local_player
export var players = []

const chunk_size = 16 # voxels cubed in each chunk
const voxel_size = .25 # unit size of each voxel

var paused = false

var uv_ids = [[Vector2(0,1), Vector2(0,0), Vector2(1,0), Vector2(1,1)]]

func _ready():
	for y in range(1, 17):
		for x in range(1, 17):
			uv_ids.append([
				Vector2(.0625*(x-1), .0625*y),
				Vector2(.0625*(x-1), .0625*(y-1)),
				Vector2(.0625*x, .0625*(y-1)),
				Vector2(.0625*x, .0625*y)
			])
