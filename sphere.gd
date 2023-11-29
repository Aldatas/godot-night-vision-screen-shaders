extends CharacterBody3D

var is_jumping: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(_delta):
	var move: Vector3 = Vector3.ZERO
	
	if Input.is_action_pressed("ui_up"):
		move.z -= 1.0
	if Input.is_action_pressed("ui_down"):
		move.z += 1.0
	if Input.is_action_pressed("ui_left"):
		move.x -= 1.0
	if Input.is_action_pressed("ui_right"):
		move.x += 1.0
	
	if Input.is_action_pressed("ui_select"):
		if $RayCast3D.is_colliding() and not is_jumping:
			move.y += 1.0
			is_jumping = true
	
	if $RayCast3D.is_colliding() and is_jumping:
		is_jumping = false
	
	move.y -= 0.50
	
	var move_normalized = move.normalized()
	set_velocity(move_normalized)
	move_and_slide()
	var _m = velocity
