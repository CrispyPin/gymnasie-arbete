extends Spatial

func set_voxel(pos, id):
	$Chunk.set_voxel($Chunk.world_to_chunk(pos), id)
