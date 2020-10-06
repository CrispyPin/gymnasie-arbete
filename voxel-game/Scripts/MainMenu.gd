extends Panel

var lobby

export var ip = "127.0.0.1"
export var port = 4242

func _ready():
	lobby = get_parent()


func _on_HostButton_pressed():
	lobby.host_game(port, 16)

func _on_JoinButton_pressed():
	lobby.join_game(ip, port)


func _on_InputIP_text_changed(new_text):
	ip = new_text

func _on_InputPort_text_changed(new_text):
	port = int(new_text)
