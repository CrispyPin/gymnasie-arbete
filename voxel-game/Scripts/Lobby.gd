extends Node

func _ready():
	var _err =	get_tree().connect("network_peer_connected", self, "_player_connected")
	_err = get_tree().connect("network_peer_disconnected", self, "_player_disconnected")

func _player_connected(id):
	print("Player " + str(id) + " joined")
	Globals.players.append(id)
	get_node("/root/Game")._new_player()

func _player_disconnected(id):
	print("Player " + str(id) + " left")
	Globals.players.erase(id)
	get_node("/root/Game")._remove_player(id)

func start_game(name, new):
	$MainMenu.hide()
	var game = preload("res://Scenes/Game.tscn").instance()
	get_tree().get_root().add_child(game)
	Globals.game = game
	game.world_name = name
	game.generate_new = new
	if !new:
		game.get_node("VoxelWorld").call_deferred("load_chunks", name)

func host_game(port, max_players, name="world", new=true):
	print("Hosting game on port " + str(port))
	var host = NetworkedMultiplayerENet.new()
	var res = host.create_server(port, max_players)
	if res != OK:
		print("Error creating server")
		return

	get_tree().set_network_peer(host)
	start_game(name, new)

func join_game(ip, port):
	print("Joining game on " + ip + ":" + str(port))
	var host = NetworkedMultiplayerENet.new()
	host.create_client(ip, port)

	get_tree().set_network_peer(host)
	
	$MainMenu.hide()
	var game = preload("res://Scenes/Game.tscn").instance()
	get_tree().get_root().add_child(game)
	Globals.game = game
	game.world_name = name
	game.generate_new = false
	game.get_node("VoxelWorld").call_deferred("request_chunks")
