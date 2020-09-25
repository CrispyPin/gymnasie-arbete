extends Node

var ip = "127.0.0.1"
var port = 4242

func exit_game():
	get_tree().quit()

func _ready():
	connect_to_server()
	get_tree().multiplayer.connect("network_peer_packet", self, "_on_packet_received")

func connect_to_server():
	var network = NetworkedMultiplayerENet.new()
	network.create_client(ip, port)
	get_tree().set_network_peer(network)

	network.connect("connection_failed", self, "_on_connection_failed")


func _on_connection_failed(error = "unknown error"):
	get_node("../PauseMenu/ConnectionMenu/labelStatus").text = "Error connecting to server: " + error

func _on_packet_received(id, packet):
	get_node("../PauseMenu/ConnectionMenu/labelServerData").text = packet.get_string_from_ascii()

func _on_Connect_pressed():
	connect_to_server()

func _on_Disconnect_pressed():
	get_tree().set_network_peer(null)

func _on_ExitBtn_pressed():
	exit_game()

func _on_EnterIP_text_changed():
	ip = get_node("../PauseMenu/ConnectionMenu/EnterIP").text
	print(ip)

func _on_EnterPort_text_changed():
	port = get_node("../PauseMenu/ConnectionMenu/EnterPort").text
	print(port)
