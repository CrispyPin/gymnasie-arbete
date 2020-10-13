extends Node

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
	if time > 1 && !$VoxelWorld.has_chunks:
		$VoxelWorld.request_chunks()

func _new_player():
	var new_player = preload("res://Scenes/Player.tscn").instance()
	new_player.set_name(str(Globals.players[-1]))
	new_player.set_network_master(Globals.players[-1])
	add_child(new_player)

