extends KinematicBody2D

var redFireButtonIsPressed = false
var greenFireButtonIsPressed = false
var velocity = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _fireLasers():
	if !Input.is_action_pressed("BUTTON_A") && !Input.is_action_pressed("BUTTON_B"):
		redFireButtonIsPressed = false
		greenFireButtonIsPressed = false 

func _moveShip():
	var input_velocity = Vector2.ZERO
	if Input.is_action_pressed("RIGHT"):
		input_velocity.x += 1
	if Input.is_action_pressed("LEFT"):
		 input_velocity.x -= 1
	if Input.is_action_pressed("DOWN"):
		input_velocity.y += 1
	if Input.is_action_pressed("UP"):
		input_velocity.y -= 1
	input_velocity = input_velocity.normalized() * Global.SPEED_MEDIUM


	if input_velocity.length() > 0:
		velocity = velocity.linear_interpolate(input_velocity, Global.ACCELERATION)
	else:
		# If there's no input, slow down to (0, 0)
		velocity = velocity.linear_interpolate(Vector2.ZERO, Global.FRICTION)
	velocity = move_and_slide(velocity)

	#move_and_slide(input_dir * Global.SPEED_MEDIUM)

func _physics_process(delta):
	_moveShip()
	_fireLasers()
	
	


func _on_FireInterval_timeout():
	pass # Replace with function body.
