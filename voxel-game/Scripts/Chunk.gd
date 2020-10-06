extends Spatial

export var voxels = []

const size = Globals.chunk_size
const vsize = Globals.voxel_size

var mesh

var mesh_array = []
var verts = PoolVector3Array()
var uvs = PoolVector2Array()
var normals = PoolVector3Array()
var indices = PoolIntArray()

# mesh constants
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
	for _x in range(size):
		voxels.append([])
		for _y in range(size):
			voxels[-1].append([])
			for _z in range(size):
				voxels[-1][-1].append(0)
	
	voxels[0][0][0] = 1
	voxels[1][1][1] = 1
	voxels[1][1][2] = 1
	voxels[1][1][3] = 1
	voxels[1][1][4] = 1
	voxels[1][2][3] = 1
	
	update_mesh()


func update_mesh():
	for x in range(size):
		for y in range(size):
			for z in range(size):
				if get_voxel_raw(x, y, z):
					update_mesh_voxel(x, y, z)
	
	mesh_array[Mesh.ARRAY_VERTEX] = verts
	mesh_array[Mesh.ARRAY_TEX_UV] = uvs
	mesh_array[Mesh.ARRAY_NORMAL] = normals
	mesh_array[Mesh.ARRAY_INDEX]  = indices
	mesh.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, mesh_array)
	
	$Mesh.create_trimesh_collision()

func update_mesh_voxel(x, y, z):
	for f in range(6):
		update_mesh_face(x, y, z, f)

func update_mesh_face(x, y, z, f):
	var pos = Vector3(x, y, z)
	if get_voxel(pos + face_normals[f]):
		return
	var i = len(verts)# where to start when indexing new tris
	
	for v in range(4):# add the 4 corners of this face
		verts.append((pos + face_verts[f][v])*vsize)
		normals.append(face_normals[f])
	
	# connect them into tris:
	indices.append(i)
	indices.append(i + 1)
	indices.append(i + 2)
	indices.append(i + 2)
	indices.append(i + 3)
	indices.append(i)
	
	#add uvs
	uvs.append(Vector2(0, 1))
	uvs.append(Vector2(0, 0))
	uvs.append(Vector2(1, 0))
	uvs.append(Vector2(1, 1))
	


func get_voxel_raw(x, y, z):
	if pos_is_valid(x,y,z):
		return voxels[x][y][z]
	return 0

func get_voxel(pos):
	if pos_is_valid(pos.x, pos.y, pos.z):
		return voxels[pos.x][pos.y][pos.z]
	return 0

func set_voxel(pos, t):
	if pos_is_valid(pos.x, pos.y, pos.z):
		voxels[pos.x][pos.y][pos.z] = t
		update_mesh()
		return true
	return false

func pos_is_valid(x, y, z):
	return !(x<0 or x>size or y<0 or y>size or z<0 or z>size)

func world_to_chunk(wpos):
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

