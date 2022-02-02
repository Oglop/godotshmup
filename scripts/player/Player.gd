extends KinematicBody2D

var redFireButtonIsPressed = false
var greenFireButtonIsPressed = false
var velocity = Vector2.ZERO
onready var timer = $FireInterval


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func setInterval(duration: float):
	timer.wait_time = duration
	timer.start()

func _fireLasers():
	if timer.is_stopped():
		if Input.is_action_just_pressed("BUTTON_A") && !Input.is_action_just_pressed("BUTTON_B"):
			Events.emit_signal("eFireRedSingleWeapon")
		if !Input.is_action_pressed("BUTTON_A") && !Input.is_action_pressed("BUTTON_B"):
			redFireButtonIsPressed = false
			greenFireButtonIsPressed = false 
		elif Input.is_action_pressed("BUTTON_A") && !Input.is_action_pressed("BUTTON_B"):
			redFireButtonIsPressed = true
			greenFireButtonIsPressed = false
			setInterval(Global.FIRE_RED_INTERVAL)
		elif !Input.is_action_pressed("BUTTON_A") && Input.is_action_pressed("BUTTON_B"):
			redFireButtonIsPressed = false
			greenFireButtonIsPressed = true
			setInterval(Global.FIRE_GREEN_INTERVAL)
		elif Input.is_action_pressed("BUTTON_A") && Input.is_action_pressed("BUTTON_B"):
			redFireButtonIsPressed = true
			greenFireButtonIsPressed = true


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
		velocity = velocity.linear_interpolate(Vector2.ZERO, Global.FRICTION)
	velocity = move_and_slide(velocity)


func _physics_process(delta):
	_moveShip()
	_fireLasers()
	

func _on_FireInterval_timeout():
	if redFireButtonIsPressed && !greenFireButtonIsPressed:
		Events.emit_signal("eFireRedWeapon")
	if !redFireButtonIsPressed && greenFireButtonIsPressed:
		Events.emit_signal("eFireGreenWeapon")
