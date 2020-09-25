extends Node

func exit_game():
	get_tree().quit()

func _ready():
	connect_to_server()
	get_tree().multiplayer.connect("network_peer_packet", self, "_on_packet_received")

func connect_to_server():
	var network = NetworkedMultiplayerENet.new()
	var ip = $PauseMenu/ConnectionMenu/EnterIP.text
	var port = $PauseMenu/ConnectionMenu/EnterPort.text.to_int()
	network.create_client(ip, port)
	get_tree().set_network_peer(network)

	network.connect("connection_failed", self, "_on_connection_failed")


func _on_connection_failed(error = "unknown error"):
	$PauseMenu/ConnectionMenu/labelStatus.text = "Error connecting to server: " + error

func _on_packet_received(id, packet):
	$PauseMenu/ConnectionMenu/labelServerData.text = packet.get_string_from_ascii()

func _on_Connect_pressed():
	connect_to_server()

func _on_Disconnect_pressed():
	get_tree().set_network_peer(null)

func _on_ExitBtn_pressed():
	exit_game()
