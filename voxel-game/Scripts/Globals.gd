extends Node

var local_player
export var players = []

const chunk_size = 16 # voxels cubed in each chunk
const voxel_size = .25 # unit size of each voxel

var uv_ids = []

func _ready():
	uv_ids = [
		[Vector2(0, .0625), Vector2(0, 0), Vector2(.0625, 0), Vector2(.0625, .0625)],
		[Vector2(.0625, .0625), Vector2(.0625, 0), Vector2(.125, 0), Vector2(.125, .0625)],
		[Vector2(.125, .0625), Vector2(.125, 0), Vector2(.1875, 0), Vector2(.1875, .0625)],
		[Vector2(.1875, .0625), Vector2(.1875, 0), Vector2(.25, 0), Vector2(.25, .0625)],
	]
