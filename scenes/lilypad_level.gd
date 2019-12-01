extends Node2D

var gameover = false


func _process(delta):
	if !$character.alive && !gameover:
		gameover()
		
	if gameover != true:
		$character/Camera2D/Panel.visible = false
	else:
		$character/Camera2D/Panel.visible = true
	
	
	if Input.is_action_pressed("ui_accept") and gameover:
		reset()


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func reset():
	gameover = false
	$character.reset()
	$character.alive = true
	$character.set_collision_mask_bit(10, false)

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.connect("timeout", self, "gameover")
	reset()
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
	gameover = true
	$character.alive = false
	
	# todo exit lilypad before reset
	$character.position.x = 150
	$character.position.y = 280
	
	print("gameover")


func _on_Button_pressed():
	reset()
	pass # Replace with function body.
