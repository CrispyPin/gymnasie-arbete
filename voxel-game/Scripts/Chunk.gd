extends Spatial

var changed = false
var voxels = PoolByteArray()

const size = Globals.chunk_size
const vsize = Globals.voxel_size
const voxel_count = size * size * size
const physical_size = size * vsize

var x_min
var x_max
var y_min
var y_max
var z_min
var z_max

var mesh
var collider

### mesh parts
var mesh_array = []
var verts = PoolVector3Array()
var uvs = PoolVector2Array()
var normals = PoolVector3Array()
var indices = PoolIntArray()
var collision_tris = PoolVector3Array()

var uv_ids

func _ready():
	$Mesh.mesh = ArrayMesh.new()
	mesh = $Mesh.mesh
	mesh_array.resize(Mesh.ARRAY_MAX)
	
	collider = $Collider
	collider.shape = ConcavePolygonShape.new()
	
	uv_ids = Globals.uv_ids
	$Mesh.uvIDs = uv_ids
	
	#initialize voxels array
	voxels.resize(size * size * size)
	for v in range(size * size * size):
		voxels[v] = 0


func init():# set after moving to correct location
	x_min = global_transform.origin.x
	x_max = global_transform.origin.x + physical_size
	y_min = global_transform.origin.y
	y_max = global_transform.origin.y + physical_size
	z_min = global_transform.origin.z
	z_max = global_transform.origin.z + physical_size
	
	for x in range(size):
		for z in range(size):
			voxels[x*size*size + z] = 1
			voxels[x*size*size + z + size] = 2
			voxels[x*size*size + z + size*2] = 2
			voxels[x*size*size + z + size*3] = 2
			voxels[x*size*size + z + size*4] = 3
			voxels[x*size*size + z + size*5] = 4
			
	_update_mesh()

func _process(_delta):
	if changed:
		_update_mesh()
		changed = false

func _update_mesh():
	$Mesh.voxels = voxels
	$Mesh.UpdateMesh()
	
	mesh_array[Mesh.ARRAY_VERTEX] = PoolVector3Array(verts)
	mesh_array[Mesh.ARRAY_TEX_UV] = PoolVector2Array(uvs)
	mesh_array[Mesh.ARRAY_NORMAL] = PoolVector3Array( normals)
	mesh_array[Mesh.ARRAY_INDEX]  = PoolIntArray(indices)

	if mesh.get_surface_count():
		mesh.surface_remove(0)
	
	if mesh_array[0]:
		mesh.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, mesh_array)
		collider.disabled = false
		collider.shape.set_faces(collision_tris)
	else:
		collider.disabled = true




func _get_voxel_raw(x, y, z):
	if _xyz_is_valid(x,y,z):
		return voxels[_xyz_to_i(x, y, z)]
	return 0

func get_voxel(wpos):
	var pos = _world_to_chunk(wpos)
	return _get_voxel_raw(pos.x, pos.y, pos.z)

func _get_voxel_local(pos):
	return _get_voxel_raw(pos.x, pos.y, pos.z)

func set_voxel(wpos, id):
	if !_wpos_is_valid(wpos):
		return false
	var idx = _pos_to_i(_world_to_chunk(wpos))
	if voxels[idx] != id:
		voxels[idx] = id
		$Mesh.UpdateMeshVoxel(idx)# TODO update neighbors
		#changed = true
	return true

func _set_voxel_local(pos, id):
	voxels[_pos_to_i(pos)] = id
	changed = true

func _xyz_is_valid(x, y, z):
	return !(x<0 or x>=size or y<0 or y>=size or z<0 or z>=size)

func _pos_is_valid(pos):
	return _xyz_is_valid(pos.x, pos.y, pos.z)

func _wpos_is_valid(wpos):
	return !(wpos.x < x_min or wpos.x >= x_max or wpos.y < y_min or wpos.y >= y_max or wpos.z < z_min or wpos.z >= z_max)

func _xyz_to_i(x, y, z):
	return x*size*size + y*size + z

func _pos_to_i(pos):
	return _xyz_to_i(pos.x, pos.y, pos.z)

func _i_to_pos(i):
	return Vector3(int(i/(size*size)), int(i/size) % size, i % size)

func _world_to_chunk(wpos):
	# localise to chunk
	var x = fposmod(wpos.x, physical_size)
	var y = fposmod(wpos.y, physical_size)
	var z = fposmod(wpos.z, physical_size)
	# scale to voxels
	x /= vsize
	y /= vsize
	z /= vsize
	# get closest
	x = int(x)
	y = int(y)
	z = int(z)
	return Vector3(x, y, z)

