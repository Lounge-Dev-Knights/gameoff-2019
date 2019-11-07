extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

const SPEED = 200

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass




func _physics_process(delta):
	var movement_direction = Vector2()
	
	if Input.is_action_pressed("ui_down"):
		movement_direction.y += 1
	if Input.is_action_pressed("ui_up"):
		movement_direction.y -= 1
	if Input.is_action_pressed("ui_left"):
		movement_direction.x -= 1
	if Input.is_action_pressed("ui_right"):
		movement_direction.x += 1
	
	move_and_slide(movement_direction * SPEED)
	

