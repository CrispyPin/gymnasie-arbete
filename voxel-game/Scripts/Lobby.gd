extends Node

func _ready():
	get_tree().connect("network_peer_connected", self, "_player_connected")


func _player_connected(id):
	print("Player " + str(id) + " connected")
	Globals.players.append(id)
	get_node("/root/GameScene")._new_player()

func start_game():
	$MainMenu.hide()
	var game = preload("res://Scenes/Game.tscn").instance()
	get_tree().get_root().add_child(game)


func host_game(port, max_players):
	print("Hosting game on port " + str(port))
	var host = NetworkedMultiplayerENet.new()
	var res = host.create_server(port, max_players)
	if res != OK:
		print("Error creating server")
		return

	get_tree().set_network_peer(host)
	start_game()

func join_game(ip, port):
	print("Joining game on " + ip + ":" + str(port))
	var host = NetworkedMultiplayerENet.new()
	host.create_client(ip, port)

	get_tree().set_network_peer(host)
	start_game()

