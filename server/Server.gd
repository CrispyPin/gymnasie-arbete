extends Node2D

func start_server(port, max_users):
	var network = NetworkedMultiplayerENet.new()
	network.create_server(port, max_users)
	get_tree().set_network_peer(network)

	$StatusLabel.text += "Server started on port " + str(port) + "\n\n"

	network.connect("peer_connected",self,"_peer_connected")
	network.connect("peer_disconnected",self,"_peer_disconnected")
	

func _ready():
  start_server(4242, 2)
  
func _peer_connected(id):
	$StatusLabel.text += "User " + str(id) + " connected\n"
	$UserCount.text = "Total Users:" + str(get_tree().get_network_connected_peers().size())
  
func _peer_disconnected(id):
	$StatusLabel.text += "User " + str(id) + " disconnected\n"
	$UserCount.text = "Total Users:" + str(get_tree().get_network_connected_peers().size())


func _on_ConfirmPort_pressed():
	start_server($PortField.text.to_int(), 2)
