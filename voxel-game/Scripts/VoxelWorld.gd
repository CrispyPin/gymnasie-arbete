extends Spatial

func set_voxel(pos):
	$Chunk.set_voxel($Chunk.world_to_chunk(pos), 0)
