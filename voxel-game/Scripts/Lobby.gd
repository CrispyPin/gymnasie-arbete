extends Node

var port = 4242
var ip = "127.0.0.1"

func _ready():
	get_tree().connect("network_peer_connected", self, "_player_connected")


func _player_connected(id):
	print("Player " + str(id) + " connected")
	globals.players.append(id)
	get_node("/root/GameScene")._new_player()

func start_game():
	$MainMenu.hide()
	var game = preload("res://Scenes/Game.tscn").instance()
	get_tree().get_root().add_child(game)


func _on_HostButton_pressed():
	print("Hosting game on port " + str(port))
	var host = NetworkedMultiplayerENet.new()
	var res = host.create_server(port, 16)
	if res != OK:
		print("Error creating server")
		return

	get_tree().set_network_peer(host)
	$Status.text = "Hosting"
	start_game()


func _on_JoinButton_pressed():
	print("Joining game on " + ip + ":" + str(port))
	var host = NetworkedMultiplayerENet.new()
	host.create_client(ip, port)
	get_tree().set_network_peer(host)
	$Status.text = "Joined"
	start_game()
