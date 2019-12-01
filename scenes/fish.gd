extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var follow = get_node("Path2D/PathFollow2D")

# Called when the node enters the scene tree for the first time.
func _ready():
	var r = RandomNumberGenerator.new()
	r.randomize()
	$Path2D/PathFollow2D.unit_offset = r.randf()
	pass # Replace with function body.


const speed = 100
func _physics_process(delta):
	
	$Path2D/PathFollow2D/Area2D/CollisionPolygon2D.disabled = true
	
	$Path2D/PathFollow2D.offset = $Path2D/PathFollow2D.offset + 200 * delta
	if ($Path2D/PathFollow2D.position.y > 0):
		visible = false;
	else:
		visible = true
		
		if $Path2D/PathFollow2D.position.y < -120:
			$Path2D/PathFollow2D/sprite.play("jump")
		else:
			$Path2D/PathFollow2D/sprite.play("hit_ground")
			$Path2D/PathFollow2D/Area2D/CollisionPolygon2D.disabled = false
	pass
	
	





# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	body.get_hit()
	pass # Replace with function body.
