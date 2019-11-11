extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

const SPEED = 10000
var jump_speed = 0

enum JumpStates {
	NONE,
	JUMPING,
	LANDING
}


var jump_state = JumpStates.NONE

func is_jumping():
	return jump_state != JumpStates.NONE
	

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass




func _physics_process(delta):
	handle_jump_state()
	
	var movement_direction = Vector2()
	
	if Input.is_action_pressed("move_down"):
		movement_direction.y += 1
	if Input.is_action_pressed("move_up"):
		movement_direction.y -= 1
	if Input.is_action_pressed("move_left"):
		movement_direction.x -= 1
	if Input.is_action_pressed("move_right"):
		movement_direction.x += 1
	
	move_and_slide(movement_direction * SPEED * delta)
	
	
	
	
	

func handle_jump_state():
	var sprite = get_node("sprite")
	var collision_shape = get_node("collision_shape")
	if (jump_speed != 0):
		sprite.move_local_y(-jump_speed)
	
	if (sprite.position.y < 0):
		jump_speed -= 1
	elif jump_speed != 0:
		jump_speed = 0
		
		sprite.position.y = 0
		set_collision_mask_bit(0, true)
	
	if (Input.is_action_pressed("jump") and sprite.position.y == 0):
		# start jump
		#jump_state = JumpStates.JUMPING
		set_collision_mask_bit(0, false)
		jump_speed = 10
		print("jump")
	
