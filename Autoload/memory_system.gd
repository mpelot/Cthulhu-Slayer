extends Node

#save data to a certain file with name as filenam
#"user://" is the shortcut to a persistent path on the user's computer
func save_data(filename, state_data):
	var save_game = FileAccess.open("user://" + filename + ".nori", FileAccess.WRITE)
	var json_string = JSON.stringify(state_data)
	save_game.store_line(json_string)
	print("save successfully")

#load data from with a file with filename
func load_state(filename):
	#Check first if the file exist
	if not FileAccess.file_exists("user://" + filename + ".nori"): 
		print("File with file name " + filename + ".nori doesn't exist")
		return null
	#Open the file
	var save_game = FileAccess.open("user://"+ filename + ".nori", FileAccess.READ)
	#Read from the file
	var json_string = save_game.get_line()
	var json = JSON.new()
	#Check if the result is valid
	var parse_result = json.parse(json_string)
	if not parse_result == OK:
		print("Parse result of " + filename + ".nori is not valid")
		return null
	var data = json.get_data()
	return data
		
