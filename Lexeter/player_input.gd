extends LineEdit


var command_dictionary = {
	"wait": ["wait","wai","wa","w"],
	"move": ["move","mov","mo","m"],
	"inventory": ["inventory","inventor","invento","invent","inven","inve","inv"],
	"pickup": ["pickup","picku","pick","pic","pi","p"],
	"talk": ["talk","tal","ta","t"],
	"help": ["help","hel","he","h"],
	"inspect": ["inspect","inspec","inspe","insp","ins"],
	"attack": ["attack","attac","atta","att","at","a","atk"],
	"interact": ["interact","interac","intera","inter","inte","int"],
	"give": ["give","giv","gi","g"],
	"save": ["save","sav","sa","s"],
	"load": ["load", "loa", "lo", "l"],
	"blank": [""]
	}
	
var player_state = "null"

var world_time = 0

onready var _label = get_node("../../response")


func handle_command(text):
	var found_command = false
	for i in command_dictionary:
		if text.to_lower() in command_dictionary[i]:
			found_command = true
			if i == "wait":
				wait()
			if i == "move":
				move()
			if i == "inventory":
				inventory()
			if i == "pickup":
				pickup()
			if i == "talk":
				talk()
			if i == "help":
				help()
			if i == "inspect":
				inspect()
			if i == "attack":
				attack()
			if i == "interact":
				interact()
			if i == "give":
				give()
			break
	if not found_command:
		_label.text = " > There is no command associated with that phrase. Please try something else, or use 'help' if you need it."
			
			
	#if found_command == false:
		#_label.text = " > There is no command associated with that phrase. Please try something else."
		


func wait():
	var wait_messages = [
		" > You waste a few minutes.",
		" > You twiddle your thumbs.",
		" > You bide your time."
	]
	var rand_index:int = randi() % wait_messages.size()
	_label.text = wait_messages[rand_index]
	
func move():
	_label.text = " > beans"

func inventory():
	pass
	
func pickup():
	pass
	
func talk():
	pass
	
var help_list = {	
	"help": " - Help: Get info on commands. Use 'help #' to access a specific page, or 'help <command>' to access a specific command.",
	"wait": " - Wait: Wait a tick. Use 'wait X' to wait X ticks.",
	"move": " - Move: Move to a new space. Use 'move [north, south, east, west]' for directional travel.",
	"inspect": " - Inspect: Inspect an item in your inventory or in the world, or maybe an NPC. If you know what you want to inspect, you can use 'inspect <target>'.",
}
var help_list_index = {
	1: "help",
	2: "wait",
	3: "move",
	4: "inspect"
}
	
func help():
	if player_state == "help1":
		player_state = "help2"
		_label.text = " > Help (2)\n"
	else:
		player_state = "help1"
		_label.text = " > Help (1)\n" + help_list[help_list_index[1]] + "\n" + help_list["wait"] + "\n" + help_list["move"] + "\n" + help_list["inspect"]
	
func inspect():
	pass
	
func attack():
	pass
	
func interact():
	pass
	
func give():
	pass

func _input(ev):
	if ev is InputEventKey and ev.scancode == KEY_ENTER:
		var input = self.text
		handle_command(input)
		self.clear()
		
	
