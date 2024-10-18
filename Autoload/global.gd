#Global autoload is responsible for managing the root scenes of the game.
extends Node
var CURRENT_SCENE = null
var NEXT_SCENE:String = ""
var	TIME_UNTIL_NEXT = 0.5
var IS_COUNTING_DOWN = false
var CUTSCENE_NEXT : String


func _ready():
	var root = get_tree().root
	CURRENT_SCENE = root.get_child(root.get_child_count() - 1)

#Splitting the switching scene into steps so we can call setting scene and 
#goto scene from different files.
#Set the NEXT_SCENE variable to path.
func set_next_scene(path):
	NEXT_SCENE = path
	
#Creating a callable to let transition call it after the scene transition are finished. 
func goto_next_scene():
	var callable = Callable(self, "to_scene")
	Transition.change_scene(callable)

#Responsble for deferred calling the goto scene
func to_scene():
	call_deferred("_deferred_goto_scene")

#Can used for most cases of switching scene
func goto_scene(path):
	set_next_scene(path)
	goto_next_scene()

#Responsible for switching the scene
func _deferred_goto_scene():
	CURRENT_SCENE.free()
	var path = NEXT_SCENE
	var s = ResourceLoader.load(path)
	CURRENT_SCENE = s.instantiate()
	get_tree().root.add_child(CURRENT_SCENE)
	get_tree().current_scene = CURRENT_SCENE
