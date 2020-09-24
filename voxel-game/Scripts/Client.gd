extends Node

func exit_game():
	get_tree().quit()

func _ready():
  var network = NetworkedMultiplayerENet.new()
  network.create_client("127.0.0.1", 4242)
  get_tree().set_network_peer(network)

  network.connect("connection_failed", self, "_on_connection_failed") #assign function for when connection fails

  get_tree().multiplayer.connect("network_peer_packet", self, "_on_packet_received")
  
func _on_connection_failed(error = "unknown error"):
  $ConnectionMenu/labelStatus.text = "Error connecting to server: " + error


func _on_packet_received(id, packet):
  $ConnectionMenu/labelServerData.text = packet.get_string_from_ascii()

func _on_Connect_pressed():
  var network = NetworkedMultiplayerENet.new()
  network.create_client("127.0.0.1", 4242)# ip, port
  get_tree().set_network_peer(network)

func _on_Disconnect_pressed():
	get_tree().set_network_peer(null)  

func _on_ExitBtn_pressed():
	exit_game()
