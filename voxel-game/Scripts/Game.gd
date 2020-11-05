extends Node

const SAVE_DIR = "user://saves/"

var world_name = "world"
var generate_new = true

var time = 0

func _ready():
	var local_player = preload("res://Scenes/Player.tscn").instance()
	local_player.set_name(str(get_tree().get_network_unique_id()))
	local_player.set_network_master(get_tree().get_network_unique_id())
	Globals.local_player = local_player
	add_child(local_player)
	local_player.global_transform.origin.y = 16
	

func _process(delta):
	time += delta
	if !$VoxelWorld.has_chunks && time > 1:
		if !get_tree().is_network_server():
			$VoxelWorld.request_chunks()
		

func _new_player():
	var new_player = preload("res://Scenes/Player.tscn").instance()
	new_player.set_name(str(Globals.players[-1]))
	new_player.set_network_master(Globals.players[-1])
	add_child(new_player)

func _remove_player(id):
	get_node(str(id)).queue_free()

func save_world(name="world"):
	var save_path = SAVE_DIR + name + "/"
	var dir = Directory.new()
	if !dir.dir_exists(save_path):
		dir.make_dir_recursive(save_path)
	
	$VoxelWorld.save(save_path + "chunks/")
	
	#save general world data here

#func load_world(name="world"):
#	pass
