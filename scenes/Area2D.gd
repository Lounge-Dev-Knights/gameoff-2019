extends Area2D
signal goal_reached

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	# self.connect("goal_reached", g, "win")
	pass
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):

	# emit_signal("goal_reached")
	print('something entered in area2d')
	
