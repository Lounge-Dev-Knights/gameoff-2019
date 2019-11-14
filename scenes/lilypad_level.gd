extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func reset():
	
	$character/Camera2D/Panel.visible = false
	
	$character.alive = true

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.connect("timeout", self, "gameover")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_water_body_entered(body):
	$Timer.start(.1)
	pass # Replace with function body.


func _on_water_body_exited(body):
	$Timer.stop()
	pass # Replace with function body.

func gameover():
	$Timer.stop()
	$character/Camera2D/Panel.visible = true
	$character.alive = false
	$character.reset()
	
	print("gameover")


func _on_Button_pressed():
	reset()
	pass # Replace with function body.
