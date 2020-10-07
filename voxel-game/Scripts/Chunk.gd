extends Spatial

var changed = false
var voxels = PoolIntArray()

const size = Globals.chunk_size
const vsize = Globals.voxel_size
const voxel_count = size * size * size
const physical_size = size * vsize

var mesh

### mesh parts
var mesh_array = []
var verts = PoolVector3Array()
var uvs = PoolVector2Array()
var normals = PoolVector3Array()
var indices = PoolIntArray()
var collision_tris = PoolVector3Array()

### mesh constants
const face_normals = [Vector3(1, 0, 0), Vector3(-1, 0, 0),
		Vector3(0, 1, 0), Vector3(0, -1, 0),
		Vector3(0, 0, 1), Vector3(0, 0, -1)]

#faces: +x -x +y -y +z -z
const face_verts = [
	[Vector3(1,0,1), Vector3(1,1,1), Vector3(1,1,0), Vector3(1,0,0)],
	[Vector3(0,0,0), Vector3(0,1,0), Vector3(0,1,1), Vector3(0,0,1)],
	
	[Vector3(0,1,0), Vector3(1,1,0), Vector3(1,1,1), Vector3(0,1,1)],
	[Vector3(0,0,1), Vector3(1,0,1), Vector3(1,0,0), Vector3(0,0,0)],
	
	[Vector3(0,0,1), Vector3(0,1,1), Vector3(1,1,1), Vector3(1,0,1)],
	[Vector3(1,0,0), Vector3(1,1,0), Vector3(0,1,0), Vector3(0,0,0)]
]

func _ready():
	mesh = $Mesh.mesh
	mesh_array.resize(Mesh.ARRAY_MAX)
	
	#initialize voxels array
	voxels.resize(size * size * size)
	for v in range(size*size*size):
		voxels[v] = 0
	
	_set_voxel_local(Vector3(0,0,0), 1)
	_set_voxel_local(Vector3(1,0,0), 1)
	_set_voxel_local(Vector3(0,1,0), 1)
	_set_voxel_local(Vector3(0,0,1), 1)
	_set_voxel_local(Vector3(1,1,1), 1)
	
	_update_mesh()
	

func _process(_delta):
	if changed:
		_update_mesh()
		changed = false

func _update_mesh():
	verts.resize(0)
	uvs.resize(0)
	normals.resize(0)
	indices.resize(0)
	collision_tris.resize(0)
	
	for vi in range(voxel_count):
		if voxels[vi]:
			for f in range(6):
				_update_mesh_face(_i_to_pos(vi), f)
	
	mesh_array[Mesh.ARRAY_VERTEX] = verts
	mesh_array[Mesh.ARRAY_TEX_UV] = uvs
	mesh_array[Mesh.ARRAY_NORMAL] = normals
	mesh_array[Mesh.ARRAY_INDEX]  = indices
	
	if mesh.get_surface_count():
		mesh.surface_remove(0)
	mesh.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, mesh_array)

	$StaticBody/CollisionShape.shape.set_faces(collision_tris)


func _update_mesh_face(pos, f):
	#var pos = Vector3(x, y, z)
	if _get_voxel_local(pos + face_normals[f]):
		return
	var i = len(verts)# offset for new tris
	
	for v in range(4):# add the 4 corner verts of this face
		verts.append((pos + face_verts[f][v])*vsize)
		normals.append(face_normals[f])
	
	# connect them into tris:
	for v in [0,1,2,2,3,0]:
		indices.append(i+v)
		#collision shape
		collision_tris.append((pos + face_verts[f][v]) * vsize)
	
	# create uvs
	uvs.append(Vector2(0, 1))
	uvs.append(Vector2(0, 0))
	uvs.append(Vector2(1, 0))
	uvs.append(Vector2(1, 1))


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
	var pos = _world_to_chunk(wpos)
	voxels[_pos_to_i(pos)] = id
	changed = true

func _set_voxel_local(pos, id):
	voxels[_pos_to_i(pos)] = id
	changed = true

func _xyz_is_valid(x, y, z):
	return !(x<0 or x>=size or y<0 or y>=size or z<0 or z>=size)

func _pos_is_valid(pos):
	return _xyz_is_valid(pos.x, pos.y, pos.z)

func _xyz_to_i(x, y, z):
	return x*size*size + y*size + z

func _pos_to_i(pos):
	return _xyz_to_i(pos.x, pos.y, pos.z)

func _i_to_pos(i):
	return Vector3(int(i/(size*size)), int(i/size) % size, i % size)

func _world_to_chunk(wpos):
	var phy_size = size*vsize
	# localise to chunk
	var x = fmod(wpos.x, phy_size)
	var y = fmod(wpos.y, phy_size)
	var z = fmod(wpos.z, phy_size)
	# scale to voxels
	x /= vsize
	y /= vsize
	z /= vsize
	# get closest
	x = int(x)
	y = int(y)
	z = int(z)
	return Vector3(x, y, z)

