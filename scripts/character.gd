extends KinematicBody2D


# maximal movement speed
const MAX_SPEED = 200

# current jumping speed
var jump_speed = 0

var alive = true

#var default_collision_mask

enum JumpStates {
	NONE,
	JUMPING_UP,
	LANDING
}


var jump_state = JumpStates.NONE

func is_jumping():
	return jump_state != JumpStates.NONE



func _notification(what):
	if what == 1:
		print('i won')

# Called when the node enters the scene tree for the first time.
func _ready():
	#default_collision_mask = collision_mask
	#pass # Replace with function body.
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func reset():
	pass




func _physics_process(delta):
	if !alive:
		return
	# handle jumping state or new jump action
	
	
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
		
	if movement_direction.x > 0:
		$sprite.flip_h = false
	elif movement_direction.x < 0:
		$sprite.flip_h = true
	
	# TODO acceleration and deceleration
	move_and_slide(movement_direction.normalized() * MAX_SPEED)
	
	if handle_jump_state():
		$collision_shape.disabled = true
	else:
		$collision_shape.disabled = false
		if movement_direction.length() > 0:
			$sprite.play("walk")
		else:
			$sprite.play("default")
	
	


func handle_jump_state():
	"""
	handle currente jumping state
	
	moves the sprite for vizualation
	disables collision while jumping
	"""
	
	var sprite = get_node("sprite")
	var collision_shape = get_node("collision_shape")
	
	
	match jump_state:
		JumpStates.JUMPING_UP:
			jump_speed -= 1
			
			sprite.play("jump_up")
			if jump_speed < 0:
				jump_state = JumpStates.LANDING
				
		JumpStates.LANDING:
			sprite.play("jump_down")
			
			jump_speed -= 1
			
			if (sprite.position.y > 0):
				jump_state = JumpStates.NONE
				sprite.position.y = 0
				jump_speed = 0
				$jump_timer.start(.2)
				
				
		JumpStates.NONE:
			if Input.is_action_pressed("jump") and can_jump():
				# start jump
				jump_speed = 15
				jump_state = JumpStates.JUMPING_UP
				
	if (jump_speed != 0):
		# move sprite according to current jumping speed
		sprite.move_local_y(-jump_speed)
	
	
	# return true if the character is jumping, or false if on ground
	return is_jumping()

func can_jump():
	print($jump_timer.time_left)
	if !is_jumping() and !$jump_timer.time_left > 0:
		return true
	
	return false

func win():
	print('i won')
	
func get_hit():
	alive = false