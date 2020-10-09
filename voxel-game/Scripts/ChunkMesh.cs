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
	//indexed by [face#][vert#]
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

		voxelCount = size * size * size;
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
		if (_GetVoxelLocal(pos + faceNormals[f]) != 0)
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
		//construct tris from the verts
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

	int _GetVoxelLocal(Vector3 pos)
	{
		if (PosValid(pos))
		{
			return voxels[(int)(pos.x*size*size + pos.y*size + pos.z)];
		}
		return 0;
	}

	bool PosValid(Vector3 pos)
	{
		return !(pos.x<0 || pos.x>=size || pos.y<0 || pos.y>=size || pos.z<0 || pos.z>=size);
	}
}
