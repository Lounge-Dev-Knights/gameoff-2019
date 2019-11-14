extends KinematicBody2D

# maximal movement speed
const MAX_SPEED = 200

# current jumping speed
var jump_speed = 0

# enum JumpStates {
# 	NONE,
# 	JUMPING,
# 	LANDING
# }

func _notification(what):
	if what == 1:
		print('i won')
# var jump_state = JumpStates.NONE

# func is_jumping():
# 	return jump_state != JumpStates.NONE
# 	

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass




func _physics_process(delta):
	# handle jumping state or new jump action
	var is_jumping = handle_jump_state()
	
	# evaluate and apply movement direction
	var movement_direction = Vector2()
	
	if Input.is_action_pressed("move_down"):
		movement_direction.y += 1
	if Input.is_action_pressed("move_up"):
		movement_direction.y -= 1
	if Input.is_action_pressed("move_left"):
		movement_direction.x -= 1
	if Input.is_action_pressed("move_right"):
		movement_direction.x += 1
	
	# TODO acceleration and deceleration
	move_and_slide(movement_direction.normalized() * MAX_SPEED)
	
	
	


func handle_jump_state():
	"""
	handle currente jumping state
	
	moves the sprite for vizualation
	disables collision while jumping
	"""
	
	var sprite = get_node("sprite")
	var collision_shape = get_node("collision_shape")
	
	if (jump_speed != 0):
		# move sprite according to current jumping speed
		sprite.move_local_y(-jump_speed)
	
	if (sprite.position.y < 0):
		# decelerate jumping speed into falling
		jump_speed -= 1
	elif jump_speed != 0:
		# reset sprite position and jumping speed when jump has ended
		jump_speed = 0
		sprite.position.y = 0
		set_collision_mask_bit(0, true)
	
	if (Input.is_action_pressed("jump") and sprite.position.y == 0):
		# start jump
		# disable collision
		set_collision_mask_bit(0, false)
		# set jumping speed
		jump_speed = 15
	
	# return true if the character is jumping, or false if on ground
	return sprite.position.y > 0
	

func win():
	print('i won')