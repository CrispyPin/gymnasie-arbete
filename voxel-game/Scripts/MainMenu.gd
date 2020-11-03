extends Panel

var lobby

export var ip = "127.0.0.1"
export var join_port = 4242

export var host_port = 4242
export var max_players = 16
export var load_name = ""

func _ready():
	lobby = get_parent()


func _host_game():
	lobby.host_game(host_port, max_players)

func _load_game():
	lobby.host_game(host_port, max_players, load_name)

func _join_game():
	lobby.join_game(ip, join_port)


func _set_ip(new_text):
	ip = new_text

func _set_join_port(new_text):
	join_port = int(new_text)

func _set_host_port(new_text):
	host_port = int(new_text)

func _set_max_players(new_text):
	max_players = int(new_text)

func _set_load_name(new_text):
	load_name = new_text

func _on_ExitButton_pressed():
	get_tree().quit()


