using Godot;
using static Godot.GD;
using System;
using Godot.Collections;

public class ChunkMesh : MeshInstance
{
	Node chunk;

	int size;
	float vsize;
	int voxelCount;
	float physicalSize;

	Node collider;

	// mesh parts
	Array<Vector3> verts = new Array<Vector3>();
	Array<Vector2> uvs = new Array<Vector2>();
	Array<Vector3> normals = new Array<Vector3>();
	Array<int> indices = new Array<int>();
	Array<Vector3> collisionVerts = new Array<Vector3>();

	Array<Vector2[]> uvIDs;

	byte[] voxels;

	Vector3[] faceNormals = new Vector3[] {
		new Vector3(1, 0, 0), new Vector3(-1, 0, 0),
		new Vector3(0, 1, 0), new Vector3(0, -1, 0),
		new Vector3(0, 0, 1), new Vector3(0, 0, -1)};

	Vector3[][] faceVerts = new Vector3[][] {
		new Vector3[] {new Vector3(1,0,1), new Vector3(1,1,1), new Vector3(1,1,0), new Vector3(1,0,0)},
		new Vector3[] {new Vector3(0,0,0), new Vector3(0,1,0), new Vector3(0,1,1), new Vector3(0,0,1)},

		new Vector3[] {new Vector3(0,1,0), new Vector3(1,1,0), new Vector3(1,1,1), new Vector3(0,1,1)},
		new Vector3[] {new Vector3(0,0,1), new Vector3(1,0,1), new Vector3(1,0,0), new Vector3(0,0,0)},

		new Vector3[] {new Vector3(0,0,1), new Vector3(0,1,1), new Vector3(1,1,1), new Vector3(1,0,1)},
		new Vector3[] {new Vector3(1,0,0), new Vector3(1,1,0), new Vector3(0,1,0), new Vector3(0,0,0)}
	};

	public override void _Ready()
	{
		chunk = GetNode("..");
		size = (int)chunk.Get("size");
		vsize = (float)chunk.Get("vsize");
		//uvIDs = (Array<Vector2[]>)chunk.Get("uv_ids");

		voxelCount = size * size * size;
		//voxels = new byte[voxelCount];
		physicalSize = size * vsize;

	}


	public void UpdateMesh()
	{
		verts.Resize(0);
		uvs.Resize(0);
		normals.Resize(0);
		indices.Resize(0);
		collisionVerts.Resize(0);

		for (int v = 0; v < voxelCount; v++)
		{
			if (voxels[v] != 0)
			{
				for (int f = 0; f < 6; f++)
				{
					UpdateMeshFace(IToPos(v), f, voxels[v]);
				}
			}
		}

		chunk.Set("verts", verts);
		chunk.Set("uvs", uvs);
		chunk.Set("normals", normals);
		chunk.Set("indices", indices);
		chunk.Set("collision_tris", collisionVerts);

	}

	void UpdateMeshFace(Vector3 pos, int f, byte id)
	{
		if ((int)chunk.Call("_get_voxel_local", pos + faceNormals[f]) != 0)
		{
			return;
		}
		int i = verts.Count; //offset for new tris

		for (int v = 0; v < 4; v++)
		{
			verts.Add((pos + faceVerts[f][v]) * vsize);
			normals.Add(faceNormals[f]);
			uvs.Add(uvIDs[id-1][v]);
		}

		foreach (int v in new int[] {0,1,2,2,3,0})
		{
			indices.Add(i+v);
			collisionVerts.Add((pos + faceVerts[f][v]) * vsize);
		}

	}

	Vector3 IToPos(int i)
	{
		return new Vector3((int)(i/(size*size)), (int)(i/size) % size, i % size);
	}
}
