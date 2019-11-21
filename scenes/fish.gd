extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var follow = get_node("Path2D/PathFollow2D")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


const speed = 100
func _process(delta):
	follow.set_offset(follow.get_offset() + 20)
	follow.update()
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
